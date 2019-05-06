import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

import './bloc.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final _repository = Repository();

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    final _prefs = await SharedPreferences.getInstance();

    if (event is AppStarted) {

      final token = _prefs.getString('token');

      if(token != null) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    } else if (event is LoggedIn) {
      final response = await _repository.doLogin(event.ra, event.password);

      _prefs.setString('token', response.token);

      yield AuthenticationAuthenticated();
    } else if (event is LoggedOut) {
      yield AuthenticationUnauthenticated();
    }
  }
}
