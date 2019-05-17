import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class InitialHomeState extends HomeState {}

class HomeUninitialized extends HomeState {
  @override
  String toString() => 'HomeUninitialized';
}

class HomeLoaded extends HomeState {
  @override
  String toString() => 'HomeLoaded';
}

class HomeError extends HomeState {
  final Exception e;

  HomeError(this.e);

  @override
  String toString() => 'HomeError';
}
