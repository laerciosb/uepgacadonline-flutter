import 'package:json_annotation/json_annotation.dart';

part 'discipline.g.dart';

@JsonSerializable()

class Discipline {

  Discipline(this.absences, this.className, this.cod, this.frequency,
      this.plannedClasses, this.givenClasses, this.grade1, this.grade2,
      this.gradeE, this.mean, this.name, this.status, this.year);

  @JsonKey(name: 'absences') int absences;
  @JsonKey(name: 'className') String className;
  @JsonKey(name: 'cod') String cod;
  @JsonKey(name: 'frequency') int frequency;
  @JsonKey(name: 'planned_classes') int plannedClasses;
  @JsonKey(name: 'given_classes') int givenClasses;
  @JsonKey(name: 'grade1') double grade1;
  @JsonKey(name: 'grade2') double grade2;
  @JsonKey(name: 'gradeE') double gradeE;
  @JsonKey(name: 'mean') String mean;
  @JsonKey(name: 'name') String name;
  @JsonKey(name: 'status') String status;
  @JsonKey(name: 'year') String year;

  factory Discipline.fromJson(Map<String, dynamic> json) => _$DisciplineFromJson(json);
  Map<String, dynamic> toJson() => _$DisciplineToJson(this);
}