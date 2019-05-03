import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/featured.dart';

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
  final List<Featured> featured;

  HomeLoaded({
    this.featured
  });

  @override
  String toString() => 'HomeLoaded';
}

class HomeError extends HomeState {
  @override
  String toString() => 'HomeError';
}