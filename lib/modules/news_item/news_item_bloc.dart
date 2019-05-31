import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/repositories/portal_repository.dart';

import './bloc.dart';

class NewsItemBloc extends Bloc<NewsItemEvent, NewsItemState> {
  @override
  NewsItemState get initialState => NewsItemUninitialized();

  @override
  Stream<NewsItemState> mapEventToState(
    NewsItemEvent event,
  ) async* {
    if (event is NewsItemFetch) {
      try {
        final newsItem = (await portalRepository.fetchNewsItem(event.cod)).news;
        yield NewsItemLoaded(newsItem: newsItem);
      } catch (e) {
        yield NewsItemError(e);
      }
    }
  }
}
