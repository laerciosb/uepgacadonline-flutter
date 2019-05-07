// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
      json['cod'] as String, json['time'] as String, json['title'] as String);
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'cod': instance.cod,
      'time': instance.time,
      'title': instance.title
    };
