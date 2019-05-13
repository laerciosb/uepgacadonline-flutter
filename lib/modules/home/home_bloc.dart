import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/repositories/user_repository.dart';
import 'package:uepgacadonline_flutter/services/repository.dart';
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
        final user = await userRepository.getUser();
        yield HomeLoaded(user: user);
      } catch (e) {
        yield HomeError();
      }
    }
  }
}
