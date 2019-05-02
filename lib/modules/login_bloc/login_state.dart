import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  LoginState([List props = const []]) : super(props);
}

class Uninitialized extends LoginState {
  @override
  String toString() {
    return 'NonInitialized';
  }
}

class Logged extends LoginState {
  @override
  String toString() {
    return 'Logged';
  }
}

class NonLogged extends LoginState {
  @override
  String toString() {
    return 'NonLogged';
  }
}
