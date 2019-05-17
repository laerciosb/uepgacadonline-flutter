import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeUninitialized();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeFetch) {
      try {
        yield HomeLoaded();
      } catch (e) {
        yield HomeError(e);
      }
    }
  }
}
