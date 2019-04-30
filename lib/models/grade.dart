import 'package:uepgacadonline_flutter/models/discipline.dart';

class Grade {
  List<Discipline> disciplines;

  Grade.fromJson(Map<String, dynamic> json) {
    disciplines = (json['disciplines'] as List)?.map((i) => Discipline.fromJson(i))?.toList();
  }
}