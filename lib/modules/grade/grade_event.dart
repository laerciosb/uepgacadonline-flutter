import 'package:meta/meta.dart';

@immutable
abstract class GradeEvent {}

class GradeFetch extends GradeEvent {
  @override
  String toString() => 'GradeFetch';
}

