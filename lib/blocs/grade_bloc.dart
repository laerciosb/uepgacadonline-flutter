import 'package:rxdart/rxdart.dart';
import 'package:uepgacadonline_flutter/models/grade.dart';
import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/resources/repository.dart';

class GradeBloc {
  final _repository = Repository();
  final _gradeFetcher = PublishSubject<Grade>();

  Observable<Grade> get grade => _gradeFetcher.stream;

  fetchGrade() async {
    Response response = await _repository.fetchGrade();
    _gradeFetcher.add(response.grade);
  }

  dispose() {
    _gradeFetcher.close();
  }
}

final gradeBloc = GradeBloc();
