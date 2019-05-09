// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map json) {
  return Calendar(
      json['id'] as int,
      json['title'] as String,
      json['date'] == null ? null : dateFromJson(json['date'] as String),
      json['complete'] as bool);
}

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date == null ? null : dateToJson(instance.date),
      'complete': instance.complete
    };
