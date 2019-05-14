import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';

abstract class CalendarEvent extends Equatable {
  CalendarEvent([List props = const []]) : super(props);
}

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

class ItemChanged extends CalendarEvent {
  final int id;

  ItemChanged({@required this.id}) : super([id]);

  @override
  String toString() => 'ItemChanged { id: $id }';
}

class DescriptionChanged extends CalendarEvent {
  final String description;

  DescriptionChanged({@required this.description}) : super([description]);

  @override
  String toString() => 'DescriptionChanged { description: $description }';
}

class SubmitItemPressed extends CalendarEvent {
  final int id;
  final String description;

  SubmitItemPressed({@required this.id, @required this.description})
      : super([id, description]);

  @override
  String toString() {
    return 'SubmitItemPressed { id: $id, password: $description }';
  }
}
