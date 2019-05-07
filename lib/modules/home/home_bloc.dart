import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/services/repository.dart';
import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = Repository();

  @override
  HomeState get initialState => HomeUninitialized();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeFetch) {
      try {
        final featured = (await _repository.fetchHome()).featured;
        final newsItems = (await _repository.fetchNewsItems(DateTime.now())).dailyNews;
        yield HomeLoaded(featured: featured, newsItems: newsItems);
      } catch (_) {
        yield HomeError();
      }
    }
  }
}
