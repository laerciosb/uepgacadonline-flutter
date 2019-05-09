import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/repositories/user_repository.dart';

import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationBloc authenticationBloc;

  LoginBloc({this.authenticationBloc});

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> transform(
    Stream<LoginEvent> events,
    Stream<LoginState> Function(LoginEvent event) next,
  ) {
    final observableStream = events as Observable<LoginEvent>;
    final nonDebounceStream = observableStream.where((event) {
      return (event is! RaChanged && event is! PasswordChanged);
    });
    final debounceStream = observableStream.where((event) {
      return (event is RaChanged || event is PasswordChanged);
    }).debounce(Duration(milliseconds: 300));
    return super.transform(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is RaChanged) {
      yield currentState.update(isRaValid: true);
    }

    if (event is PasswordChanged) {
      yield currentState.update(isPasswordValid: true);
    }

    if (event is LoginWithCredentialsPressed) {
      yield LoginState.loading();
      try {
        final doLogin = await userRepository.doLogin(event.ra, event.password);
        if(!doLogin[1]) throw("Usuário/senha inválido!");

        authenticationBloc.dispatch(
            LoggedIn(ra: event.ra, password: event.password));

        yield LoginState.success();
      } catch (e) {
        print(e.toString());
        yield LoginState.failure();
      }
    }
  }
}
