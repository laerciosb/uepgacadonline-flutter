// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsItem _$NewsItemFromJson(Map json) {
  return NewsItem(json['author'] as String, json['title'] as String,
      json['subtitle'] as String, json['content'] as String);
}

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'content': instance.content
    };
