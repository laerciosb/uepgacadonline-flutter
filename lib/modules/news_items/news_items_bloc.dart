import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/modules/news_items/bloc.dart';
import 'package:uepgacadonline_flutter/services/repository.dart';

class NewsItemsBloc extends Bloc<NewsItemsEvent, NewsItemsState> {
  final _repository = Repository();

  @override
  NewsItemsState get initialState => NewsItemsUninitialized();

  @override
  Stream<NewsItemsState> mapEventToState(
    NewsItemsEvent event,
  ) async* {
    if (event is NewsItemsFetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is NewsItemsUninitialized) {
          final page = 1;

          final newsItems = (await _repository.fetchNewsItems(page)).newsItems;

          yield NewsItemsLoaded(
              newsItems: newsItems, hasReachedMax: false, page: page + 1);
        }

        if (currentState is NewsItemsLoaded) {
          final newsItems = (await _repository
                  .fetchNewsItems((currentState as NewsItemsLoaded).page))
              .newsItems;
          yield newsItems.isEmpty
              ? (currentState as NewsItemsLoaded).copyWith(hasReachedMax: true)
              : NewsItemsLoaded(
                  newsItems:
                      (currentState as NewsItemsLoaded).newsItems + newsItems,
                  page: (currentState as NewsItemsLoaded).page + 1,
                  hasReachedMax: false);
        }
      } catch (e) {
        print(e.toString());
        yield NewsItemsError();
      }
    }
  }

  bool _hasReachedMax(NewsItemsState state) =>
      state is NewsItemsLoaded && state.hasReachedMax;
}
