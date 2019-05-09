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
        await calendarRepository
            .create(Calendar(null, "Teste", DateTime.now(), false));
        await calendarRepository
            .create(Calendar(null, "Teste 2", DateTime.now(), false));
        await calendarRepository
            .create(Calendar(null, "Teste 3", DateTime.now(), false));

        final calendar = await calendarRepository.all();
        yield CalendarLoaded(calendar: calendar);
      } catch (e) {
        print(e.toString());
        yield CalendarError();
      }
    }
  }
}
