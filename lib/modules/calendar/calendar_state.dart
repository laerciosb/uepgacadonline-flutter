import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';

@immutable
abstract class CalendarState extends Equatable {}

class InitialCalendarState extends CalendarState {}

class CalendarUninitialized extends CalendarState {
  @override
  String toString() => 'CalendarUninitialized';
}

class CalendarLoaded extends CalendarState {
  final List<Calendar> calendar;

  CalendarLoaded({this.calendar});

  @override
  String toString() => 'CalendarLoaded';
}

class CalendarError extends CalendarState {
  @override
  String toString() => 'CalendarError';
}
