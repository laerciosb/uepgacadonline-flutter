import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';
import './bloc.dart';

class NewsItemsBloc extends Bloc<NewsItemsEvent, NewsItemsState> {
  final _repository = Repository();

  @override
  NewsItemsState get initialState => NewsItemsUninitialized();

  @override
  Stream<NewsItemsState> mapEventToState(
    NewsItemsEvent event,
  ) async* {
    if(event is NewsItemsFetch) {
      try {
        final newsItems = (await _repository.fetchNewsItems()).dailyNews;
        yield NewsItemsLoaded(newsItems: newsItems);
      } catch (_) {
        yield NewsItemsError();
      }
    }
  }
}
