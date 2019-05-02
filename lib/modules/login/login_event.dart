import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class AppStart extends LoginEvent {
  @override
  String toString() {
    return 'AppStarted';
  }
}

class LoggedIn extends LoginEvent {
  @override
  String toString() {
    return 'LoggedIn';
  }
}

class LoggedOut extends LoginEvent {
  @override
  String toString() {
    return 'LoggedOut';
  }
}