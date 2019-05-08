import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/repositories/user_repository.dart';

import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final token = await userRepository.getToken();
      yield token != null
          ? AuthenticationAuthenticated()
          : AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      userRepository.clearToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
