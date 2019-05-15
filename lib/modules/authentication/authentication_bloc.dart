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
    print(event);

    if (event is AppStarted) {
      yield AuthenticationUnauthenticated();
      final user = await userRepository.getUser();
      yield user != null
          ? AuthenticationAuthenticated()
          : AuthenticationUnauthenticated();
    }

    if (event is LoggedIn) {
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      print(event);
      await userRepository.doLogout();
      yield AuthenticationUnauthenticated();
    }
  }
}
