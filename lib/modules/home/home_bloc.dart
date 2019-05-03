import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';
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
        yield HomeLoaded(featured: featured);
      } catch (_) {
        yield HomeError();
      }
    }
  }
}
