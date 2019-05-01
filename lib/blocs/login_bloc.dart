import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

class LoginBloc {
  final _repository = Repository();

  final _raController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Observable<String> get ra => _raController.stream.transform(
      StreamTransformer<String, String>.fromHandlers(
          handleData: (ra, sink) => ra.length == 0
              ? sink.addError('Necessário informar o RA.')
              : ra.length == 8
                  ? sink.add(ra)
                  : sink.addError('Necessário informar um RA válido.')));

  Observable<String> get password => _passwordController.stream.transform(
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) => password.length != 0
              ? sink.add(password)
              : sink.addError('Necessário informar a senha.')));

  Function(String) get changeRa => _raController.sink.add;

  Function(String) get changePassword => _passwordController.add;

  Observable<bool> get isValid =>
      Observable.combineLatest2(ra, password, (r, p) => true);

  submit() async {
    final ra = _raController.value;
    final password = _passwordController.value;

    Response response = await _repository.doLogin(ra, password);
    print(response.user.toString());
  }

  dispose() {
    _raController.close();
    _passwordController.close();
  }
}

final loginBloc = LoginBloc();
