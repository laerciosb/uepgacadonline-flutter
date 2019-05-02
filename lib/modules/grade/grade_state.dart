import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/grade.dart';

@immutable
abstract class GradeState extends Equatable {}

class InitialGradeState extends GradeState {}

class GradeUninitialized extends GradeState {
  @override
  String toString() => 'GradeUninitialized';
}

class GradeLoaded extends GradeState {
  final Grade grade;

  GradeLoaded({
    this.grade
  });

  @override
  String toString() => 'GradeLoaded';
}

class GradeError extends GradeState {
  @override
  String toString() => 'GradeError';
}



