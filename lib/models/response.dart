import 'package:uepgacadonline_flutter/models/discipline.dart';
import 'package:uepgacadonline_flutter/models/featured.dart';
import 'package:uepgacadonline_flutter/models/menu.dart';
import 'package:uepgacadonline_flutter/models/news_items.dart';
import 'package:uepgacadonline_flutter/models/grade.dart';
import 'package:uepgacadonline_flutter/models/news_item.dart';
import 'package:uepgacadonline_flutter/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()

class Response {

  Response(this.message, this.status, this.token, this.dailyNews, this.grade,
      this.weeklyMenu, this.news, this.user, this.featured);

  @JsonKey(name: 'message') String message;
  @JsonKey(name: 'status') bool status;
  @JsonKey(name: 'token') String token;

  @JsonKey(name: 'daily_news') NewsItems dailyNews;
  @JsonKey(name: 'grade') Grade grade;
  @JsonKey(name: 'weekly_menu') List<Menu> weeklyMenu;
  @JsonKey(name: 'news') NewsItem news;
  @JsonKey(name: 'perfil') User user;
  @JsonKey(name: 'featured') List<Featured> featured;

  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}
