import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

import './bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final _repository = Repository();

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield AuthenticationUnauthenticated();
    } else if (event is LoggedIn) {
      final response = await _repository.doLogin(event.ra, event.password);
      yield AuthenticationAuthenticated(response.user);
    } else if (event is LoggedOut) {
      yield AuthenticationUnauthenticated();
    }
  }
}
