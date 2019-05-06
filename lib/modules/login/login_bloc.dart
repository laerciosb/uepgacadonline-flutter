import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final _repository = Repository();

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
    final _prefs = await SharedPreferences.getInstance();

    if (event is RaChanged) {
      yield currentState.update(
        isRaValid: true
      );
    } else if (event is PasswordChanged) {
      yield currentState.update(
        isPasswordValid: true
      );
    } else if (event is LoginWithCredentialsPressed) {
      yield LoginState.loading();
      try {
        final response = await _repository.doLogin(event.ra, event.password);

        print("set TOKEN:"+response.token);
        _prefs.setString('token', response.token);

        yield LoginState.success();
      } catch(_) {
        yield LoginState.failure();
      }
    }
  }
}
