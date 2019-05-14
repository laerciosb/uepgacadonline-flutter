// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Menu _$MenuFromJson(Map json) {
  return Menu(
      json['date'] == null ? null : dateFromJson(json['date'] as String),
      json['day'] as String,
      (json['food'] as List)?.map((e) => e as String)?.toList())
    ..lunch = (json['lunch'] as List)?.map((e) => e as String)?.toList()
    ..dinner = (json['dinner'] as List)?.map((e) => e as String)?.toList();
}

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'date': instance.date == null ? null : dateToJson(instance.date),
      'day': instance.day,
      'food': instance.food,
      'lunch': instance.lunch,
      'dinner': instance.dinner
    };
