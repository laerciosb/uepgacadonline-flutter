import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class RaChanged extends LoginEvent {
  final String ra;

  RaChanged({@required this.ra}) : super([ra]);

  @override
  String toString() => 'RaChanged { ra :$ra }';
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends LoginEvent {
  final String ra;
  final String password;

  Submitted({@required this.ra, @required this.password})
      : super([ra, password]);

  @override
  String toString() {
    return 'Submitted { ra: $ra, password: $password }';
  }
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String ra;
  final String password;

  LoginWithCredentialsPressed({@required this.ra, @required this.password})
      : super([ra, password]);

  @override
  String toString() {
    return 'LoginWithCredentialsPressed { ra: $ra, password: $password }';
  }
}