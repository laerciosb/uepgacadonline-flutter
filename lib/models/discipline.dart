import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uepgacadonline_flutter/enums/effectiveness_type.dart';

part 'discipline.g.dart';

@JsonSerializable()
class Discipline {
  Discipline(
      this.absences,
      this.className,
      this.cod,
      this.frequency,
      this.plannedClasses,
      this.givenClasses,
      this.grade1,
      this.grade2,
      this.gradeE,
      this.mean,
      this.name,
      this.status,
      this.year);

  @JsonKey(name: 'absences')
  int absences;
  @JsonKey(name: 'className')
  String className;
  @JsonKey(name: 'cod')
  String cod;
  @JsonKey(name: 'frequency')
  int frequency;
  @JsonKey(name: 'planned_classes')
  int plannedClasses;
  @JsonKey(name: 'given_classes')
  int givenClasses;
  @JsonKey(name: 'grade1')
  double grade1;
  @JsonKey(name: 'grade2')
  double grade2;
  @JsonKey(name: 'gradeE')
  double gradeE;
  @JsonKey(name: 'mean')
  String mean;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'year')
  String year;

  double get meanDouble {
    double value;

    if (grade1 != null && grade2 != null && gradeE != null)
      value = double.parse(mean);
    else if (grade1 != null && grade2 != null)
      value = (grade1 + grade2) / 2;
    else if (grade1 != null)
      value = grade1;
    else
      value = null;

    return value;
  }

  bool get isSemiannual => year.contains('-');

  int get semester => isSemiannual ? int.parse(year.split('-')[1]) : 1;

  Effectiveness get effectiviness {
    Effectiveness value;

    if (meanDouble == null)
      value = Effectiveness.undefined;
    else if (meanDouble < 5.0)
      value = Effectiveness.very_bad;
    else if (meanDouble < 7.0)
      value = Effectiveness.bad;
    else if (meanDouble < 8.0)
      value = Effectiveness.ok;
    else if (meanDouble < 9.0)
      value = Effectiveness.good;
    else if (meanDouble < 10.0)
      value = Effectiveness.excellent;
    else
      value = Effectiveness.unbelievable;

    if (frequency < 75) {
      value = Effectiveness.very_bad;
    }

    return value;
  }

  IconData get iconData {
    IconData value;

    switch (effectiviness) {
      case Effectiveness.undefined:
        value = Icons.sentiment_neutral;
        break;
      case Effectiveness.very_bad:
        value = Icons.sentiment_very_dissatisfied;
        break;
      case Effectiveness.bad:
        value = Icons.sentiment_dissatisfied;
        break;
      case Effectiveness.ok:
        value = Icons.sentiment_neutral;
        break;
      case Effectiveness.good:
        value = Icons.sentiment_satisfied;
        break;
      case Effectiveness.excellent:
        value = Icons.sentiment_satisfied;
        break;
      case Effectiveness.unbelievable:
        value = Icons.sentiment_very_satisfied;
        break;
    }

    return value;
  }

  Color get color {
    Color value;

    switch (effectiviness) {
      case Effectiveness.undefined:
        value = Color(0xff4a6aff);
        break;
      case Effectiveness.very_bad:
        value = Colors.red;
        break;
      case Effectiveness.bad:
        value = Colors.orange;
        break;
      case Effectiveness.ok:
        value = Colors.amber;
        break;
      case Effectiveness.good:
        value = Colors.lime[600];
        break;
      case Effectiveness.excellent:
        value = Colors.lightGreen;
        break;
      case Effectiveness.unbelievable:
        value = Colors.green;
        break;
    }

    return value;
  }

  factory Discipline.fromJson(Map<String, dynamic> json) =>
      _$DisciplineFromJson(json);
  Map<String, dynamic> toJson() => _$DisciplineToJson(this);
}
