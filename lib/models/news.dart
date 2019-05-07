import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()

class News {

  News(this.cod, this.time, this.title);

  @JsonKey(name: 'cod') String cod;
  @JsonKey(name: 'time') String time;
  @JsonKey(name: 'title') String title;

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}