// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Calendar _$CalendarFromJson(Map json) {
  return Calendar(json['id'] as int, json['title'] as String,
      json['category_id'] as int, json['date'] as int, json['complete'] as int);
}

Map<String, dynamic> _$CalendarToJson(Calendar instance) => <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'title': instance.title,
      'date': instance.date,
      'complete': instance.complete
    };
