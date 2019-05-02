import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final _repository = Repository();

  @override
  LoginState get initialState => Uninitialized();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if(event is AppStart) {

    } else if(event is LoggedIn) {

    } else if(event is LoggedOut) {

    }
  }

  Stream<LoginState> _mapAppStartToState() async* {

  }

  Stream<LoggedIn> _mapLoggedInToState() async* {

  }

  Stream<LoggedOut> _mapLoggedOutToState() async* {

  }
}
