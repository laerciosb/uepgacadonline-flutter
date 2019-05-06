import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/modules/news_items/bloc.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

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
          final date = DateTime.now();
          final newsItems = (await _repository.fetchNewsItems(date)).dailyNews;
          yield NewsItemsLoaded(
              newsItems: newsItems,
              hasReachedMax: false,
              date: date.subtract(Duration(days: 1)));
        } else if (currentState is NewsItemsLoaded) {
          final newsItems = (await _repository
                  .fetchNewsItems((currentState as NewsItemsLoaded).date))
              .dailyNews;
          yield newsItems == null
              ? (currentState as NewsItemsLoaded).copyWith(
                  hasReachedMax: true,
                  date: (currentState as NewsItemsLoaded)
                      .date
                      .subtract(Duration(days: 1)))
              : NewsItemsLoaded(newsItems: newsItems, hasReachedMax: false);
        }
      } catch (_) {
        yield NewsItemsError();
      }
    }
  }

  bool _hasReachedMax(NewsItemsState state) =>
      state is NewsItemsLoaded && state.hasReachedMax;
}
