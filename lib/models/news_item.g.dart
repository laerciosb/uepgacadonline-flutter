// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItem _$NewsItemFromJson(Map json) {
  return NewsItem(json['author'] as String, json['title'] as String,
      json['subtitle'] as String, json['content'] as String)
    ..created_at = json['created_at'] == null
        ? null
        : dateFromJson(json['created_at'] as String)
    ..updated_at = json['updated_at'] == null
        ? null
        : dateFromJson(json['updated_at'] as String);
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'content': instance.content,
      'created_at':
          instance.created_at == null ? null : dateToJson(instance.created_at),
      'updated_at':
          instance.updated_at == null ? null : dateToJson(instance.updated_at)
    };
