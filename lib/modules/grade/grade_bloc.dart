import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:uepgacadonline_flutter/services/repository.dart';

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
        final disciplines = (await _repository.fetchGrade()).disciplines;
        yield GradeLoaded(disciplines: disciplines);
      } catch (e) {
        print(e.toString());
        yield GradeError();
      }
    }
  }
}
