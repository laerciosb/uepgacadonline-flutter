import 'package:json_annotation/json_annotation.dart';
import 'package:uepgacadonline_flutter/models/discipline.dart';

part 'grade.g.dart';

@JsonSerializable()

class Grade {

  Grade(this.disciplines);

  @JsonKey(name: 'disciplines') List<Discipline> disciplines;

  factory Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);
  Map<String, dynamic> toJson() => _$GradeToJson(this);
}