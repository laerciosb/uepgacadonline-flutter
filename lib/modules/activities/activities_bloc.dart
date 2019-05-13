import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/services/repository.dart';
import './bloc.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  final _repository = Repository();

  @override
  ActivitiesState get initialState => ActivitiesUninitialized();

  @override
  Stream<ActivitiesState> mapEventToState(
      ActivitiesEvent event,
      ) async* {
    if(event is ActivitiesFetch) {
      try {
        final activities = (await _repository.fetchActivities()).activities;
        yield ActivitiesLoaded(activities: activities);
      } catch (e) {
        yield ActivitiesError(e);
      }
    }
  }
}
