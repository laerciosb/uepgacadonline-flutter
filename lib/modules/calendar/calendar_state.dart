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
  final List<Calendar> all;

  CalendarLoaded({this.calendar, this.all});

  @override
  String toString() => 'CalendarLoaded';
}

class CalendarError extends CalendarState {
  @override
  String toString() => 'CalendarError';
}

class CalendarDialog extends CalendarState {
  @override
  String toString() => 'CalendarDialog';
}

class CalendarFormState extends CalendarState {
  final bool isValidItem;
  final bool isValidDescription;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isValidItem && isValidDescription;

  CalendarFormState({
    @required this.isValidItem,
    @required this.isValidDescription,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory CalendarFormState.empty() {
    return CalendarFormState(
      isValidItem: true,
      isValidDescription: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory CalendarFormState.loading() {
    return CalendarFormState(
      isValidItem: true,
      isValidDescription: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory CalendarFormState.failure() {
    return CalendarFormState(
      isValidItem: true,
      isValidDescription: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory CalendarFormState.success() {
    return CalendarFormState(
      isValidItem: true,
      isValidDescription: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  CalendarFormState update({
    bool isValidItem,
    bool isValidDescription,
  }) {
    return copyWith(
      isValidItem: isValidItem,
      isValidDescription: isValidDescription,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  CalendarFormState copyWith({
    bool isValidItem,
    bool isValidDescription,
    bool isSubmitEnabled,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return CalendarFormState(
      isValidItem: isValidItem ?? this.isValidItem,
      isValidDescription: isValidDescription ?? this.isValidDescription,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
