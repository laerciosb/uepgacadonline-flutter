// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activity _$ActivityFromJson(Map json) {
  return Activity(
      json['date'] == null ? null : dateFromJson(json['date'] as String),
      json['hours'] as String,
      json['minutes'] as String,
      json['protocol'] as String);
}

Map<String, dynamic> _$ActivityToJson(Activity instance) => <String, dynamic>{
      'date': instance.date == null ? null : dateToJson(instance.date),
      'hours': instance.hours,
      'minutes': instance.minutes,
      'protocol': instance.protocol
    };
