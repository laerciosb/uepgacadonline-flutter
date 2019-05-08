// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discipline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discipline _$DisciplineFromJson(Map json) {
  return Discipline(
      json['absences'] as int,
      json['className'] as String,
      json['cod'] as String,
      json['frequency'] as int,
      json['planned_classes'] as int,
      json['given_classes'] as int,
      (json['grade1'] as num)?.toDouble(),
      (json['grade2'] as num)?.toDouble(),
      (json['gradeE'] as num)?.toDouble(),
      json['mean'] as String,
      json['name'] as String,
      json['status'] as String,
      json['year'] as String);
}

Map<String, dynamic> _$DisciplineToJson(Discipline instance) =>
    <String, dynamic>{
      'absences': instance.absences,
      'className': instance.className,
      'cod': instance.cod,
      'frequency': instance.frequency,
      'planned_classes': instance.plannedClasses,
      'given_classes': instance.givenClasses,
      'grade1': instance.grade1,
      'grade2': instance.grade2,
      'gradeE': instance.gradeE,
      'mean': instance.mean,
      'name': instance.name,
      'status': instance.status,
      'year': instance.year
    };
