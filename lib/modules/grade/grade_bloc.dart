import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

import './bloc.dart';

class GradeBloc extends Bloc<GradeEvent, GradeState> {
  final _repository = Repository();

  @override
  GradeState get initialState => GradeUninitialized();

  @override
  Stream<GradeState> mapEventToState(
    GradeEvent event,
  ) async* {
    if (event is GradeFetch) {
      try {
        final grade = (await _repository.fetchGrade()).grade;
        yield GradeLoaded(grade: grade);
      } catch (_) {
        yield GradeError();
      }
    }
  }
}
