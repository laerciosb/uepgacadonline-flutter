import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/user.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';
}

class AuthenticationAuthenticated extends AuthenticationState {
  final User user;

  AuthenticationAuthenticated({this.user});

  @override
  String toString() => 'Authenticated';
}

class AuthenticationUnauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}