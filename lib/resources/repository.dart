import 'dart:async';

import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/resources/grade_service.dart';

class Repository {
  final gradeService = GradeService();

  Future<Response> fetchGrade() => gradeService.fetchGrade();
}