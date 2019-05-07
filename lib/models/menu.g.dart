// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map json) {
  return Menu(
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['day'] as String,
      (json['food'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'day': instance.day,
      'food': instance.food
    };
