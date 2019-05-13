import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/activity.dart';

@immutable
abstract class ActivitiesState extends Equatable {
  ActivitiesState([List props = const []]) : super(props);
}

class InitialActivitiesState extends ActivitiesState {}

class ActivitiesUninitialized extends ActivitiesState {
  @override
  String toString() => 'ActivitiesUninitialized';
}

class ActivitiesLoaded extends ActivitiesState {
  final List<Activity> activities;

  ActivitiesLoaded({this.activities});

  @override
  String toString() => 'ActivitiesLoaded';
}

class ActivitiesError extends ActivitiesState {
  final Exception e;

  ActivitiesError(this.e);

  @override
  String toString() => 'ActivitiesError';
}
