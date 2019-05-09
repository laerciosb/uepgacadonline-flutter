import 'package:meta/meta.dart';

@immutable
abstract class CalendarEvent {}

class CalendarFetch extends CalendarEvent {
  @override
  String toString() => 'CalendarFetch';
}

