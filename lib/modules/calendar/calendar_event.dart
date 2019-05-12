import 'package:uepgacadonline_flutter/models/calendar.dart';

abstract class CalendarEvent {}

class CalendarFetch extends CalendarEvent {
  @override
  String toString() => 'CalendarFetch';
}

class CalendarOpenDialog extends CalendarEvent {
  Calendar calendar;

  CalendarOpenDialog({this.calendar});

  @override
  String toString() => 'CalendarOpenDialog';
}
