import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_items.g.dart';

@JsonSerializable()

class NewsItems {

  NewsItems(this.date, this.news);

  @JsonKey(name: 'date') DateTime date;
  @JsonKey(name: 'news') List<News> news;

  factory NewsItems.fromJson(Map<String, dynamic> json) => _$NewsItemsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsItemsToJson(this);
}