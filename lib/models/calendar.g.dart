// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map json) {
  return Calendar(
      json['id'] as int,
      json['title'] as String,
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['complete'] as int);
}

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date?.toIso8601String(),
      'complete': instance.complete
    };
