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
    if(event is NewsItemsFetch && !_hasReachedMax(currentState)) {
      try {
        final newsItems = (await _repository.fetchNewsItems()).dailyNews;
        yield NewsItemsLoaded(newsItems: newsItems, hasReachedMax: false);
      } catch (_) {
        yield NewsItemsError();
      }
    }
  }

  bool _hasReachedMax(NewsItemsState state) =>
      state is NewsItemsLoaded && state.hasReachedMax;
}
