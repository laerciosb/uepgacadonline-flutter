// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grade _$GradeFromJson(Map json) {
  return Grade((json['disciplines'] as List)
      ?.map((e) => e == null
          ? null
          : Discipline.fromJson((e as Map)?.map(
              (k, e) => MapEntry(k as String, e),
            )))
      ?.toList());
}

Map<String, dynamic> _$GradeToJson(Grade instance) =>
    <String, dynamic>{'disciplines': instance.disciplines};
