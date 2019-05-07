// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItems _$NewsItemsFromJson(Map<String, dynamic> json) {
  return NewsItems(
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      (json['news'] as List)
          ?.map((e) =>
              e == null ? null : News.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$NewsItemsToJson(NewsItems instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'news': instance.news
    };
