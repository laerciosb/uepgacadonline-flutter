import 'package:json_annotation/json_annotation.dart';

part 'news_item.g.dart';

@JsonSerializable()

class NewsItem {

  NewsItem(this.author, this.title, this.subtitle, this.content,
      this.created_at, this.updated_at);

  @JsonKey(name: 'author') String author;
  @JsonKey(name: 'title') String title;
  @JsonKey(name: 'subtitle') String subtitle;
  @JsonKey(name: 'content') String content;
  @JsonKey(name: 'created_at') DateTime created_at;
  @JsonKey(name: 'updated_at') DateTime updated_at;

  factory NewsItem.fromJson(Map<String, dynamic> json) => _$NewsItemFromJson(json);
  Map<String, dynamic> toJson() => _$NewsItemToJson(this);
}