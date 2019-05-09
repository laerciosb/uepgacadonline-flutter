// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItems _$NewsItemsFromJson(Map json) {
  return NewsItems(
      json['date'] == null ? null : dateFromJson(json['date'] as String),
      (json['news'] as List)
          ?.map((e) => e == null
              ? null
              : News.fromJson((e as Map)?.map(
                  (k, e) => MapEntry(k as String, e),
                )))
          ?.toList());
}

Map<String, dynamic> _$NewsItemsToJson(NewsItems instance) => <String, dynamic>{
      'date': instance.date == null ? null : dateToJson(instance.date),
      'news': instance.news
    };
