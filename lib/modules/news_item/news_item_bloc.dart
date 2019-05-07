import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/services/repository.dart';
import './bloc.dart';

class NewsItemBloc extends Bloc<NewsItemEvent, NewsItemState> {
  final _repository = Repository();

  @override
  NewsItemState get initialState => NewsItemUninitialized();

  @override
  Stream<NewsItemState> mapEventToState(
    NewsItemEvent event,
  ) async* {
    if(event is NewsItemFetch) {
      try {
        final newsItem = (await _repository.fetchNewsItem(event.cod)).news;
        yield NewsItemLoaded(newsItem: newsItem);
      } catch (_) {
        yield NewsItemError();
      }
    }
  }
}
