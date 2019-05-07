// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map<String, dynamic> json) {
  return Grade((json['disciplines'] as List)
      ?.map((e) =>
          e == null ? null : Discipline.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$GradeToJson(Grade instance) =>
    <String, dynamic>{'disciplines': instance.disciplines};
