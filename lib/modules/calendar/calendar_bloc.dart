import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';
import 'package:uepgacadonline_flutter/repositories/calendar_repository.dart';

import './bloc.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  @override
  CalendarState get initialState => CalendarUninitialized();

  @override
  Stream<CalendarState> mapEventToState(
    CalendarEvent event,
  ) async* {
    if (event is CalendarFetch) {
      yield CalendarUninitialized();
      try {
        final calendar = await calendarRepository.findByDate(event.date);
        yield CalendarLoaded(calendar: calendar);
      } catch (e) {
        print(e.toString());
        yield CalendarError();
      }
    }

    if (event is CalendarOpenDialog) {
      final lastState = currentState;

      yield CalendarDialog();
      yield lastState;
    }

    if (event is SubmitItemPressed) {
      try {
        final lastState = (currentState as CalendarLoaded);
        final calendar = Calendar(
            Random().nextInt(99999999),
            event.description,
            event.id,
            DateTime(event.date.year, event.date.month, event.date.day)
                .millisecondsSinceEpoch,
            0);

        await calendarRepository.create(calendar);

        var calendars = lastState.calendar;
        calendars.add(calendar);

        yield CalendarUninitialized();
        yield CalendarLoaded(calendar: calendars);
      } catch (e) {
        print(e.toString());
        yield CalendarError();
      }
    }

    if (event is DeleteItem) {
      try {
        final lastState = (currentState as CalendarLoaded);

        await calendarRepository.delete(event.id);
        final item = lastState.calendar
            .where((calendar) => (calendar.id == event.id))
            .first;

        var calendars = lastState.calendar;
        calendars.remove(item);

        yield CalendarUninitialized();
        yield CalendarLoaded(calendar: calendars);
      } catch (e) {
        print(e.toString());
        yield CalendarError();
      }
    }
  }
}
