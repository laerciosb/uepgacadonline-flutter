import 'dart:async';

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
        final calendar_ = Calendar(1, "Teste", DateTime.now(), 0);
        await calendarRepository.create(calendar_);
        print(calendar_.toString());

        final calendar = await calendarRepository.all();
        yield CalendarLoaded(calendar: calendar);
      } catch (e) {
        print(e.toString());
        yield CalendarError();
      }
    }
  }
}
