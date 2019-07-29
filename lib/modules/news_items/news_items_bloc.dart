import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:uepgacadonline_flutter/modules/news_items/bloc.dart';
import 'package:uepgacadonline_flutter/repositories/portal_repository.dart';
import 'package:uepgacadonline_flutter/services/repository.dart';

class NewsItemsBloc extends Bloc<NewsItemsEvent, NewsItemsState> {
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

          var newsItems =
              (await portalRepository.fetchNewsItems(page)).newsItems;

          yield NewsItemsLoaded(
              newsItems: newsItems, hasReachedMax: false, page: page + 1);
        }

        if (currentState is NewsItemsLoaded) {
          final newsItems = (await portalRepository
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
        yield NewsItemsError(e);
      }
    }
  }

  bool _hasReachedMax(NewsItemsState state) =>
      state is NewsItemsLoaded && state.hasReachedMax;
}
