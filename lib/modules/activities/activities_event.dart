import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ActivitiesEvent extends Equatable {
  ActivitiesEvent([List props = const []]) : super(props);
}

class ActivitiesFetch extends ActivitiesEvent {
  @override
  String toString() => 'ActivitiesFetch';
}

