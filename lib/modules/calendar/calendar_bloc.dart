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
      try {
        final calendar = await calendarRepository.all();
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
      yield CalendarFormState.loading();
      try {
        final calendar = Calendar(
            Random().nextInt(100000), event.description, DateTime.now(), 0);
        final doCreate = await calendarRepository.create(calendar);

        yield CalendarUninitialized();
      } catch (e) {
        print(e.toString());
        yield CalendarError();
      }
    }
  }
}
