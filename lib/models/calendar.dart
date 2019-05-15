import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:uepgacadonline_flutter/helpers/date_helper.dart';
import 'package:uepgacadonline_flutter/repositories/category_repository.dart';

import 'category.dart';

part 'calendar.g.dart';

@JsonSerializable()
class Calendar {
  // raw sql
  static final table = "calendar";
  static final createTable = "CREATE TABLE $table ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
      "category_id INTEGER,"
      "title TEXT,"
      "date INTEGER,"
      "complete BIT"
      ")";

  Calendar(this.id, this.title, this.categoryId, this.date, this.complete);

  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'category_id')
  int categoryId;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'date')
  int date;
  @JsonKey(name: 'complete')
  int complete;

  Category get category => categoryRepository.find(categoryId);

  factory Calendar.fromJson(Map<String, dynamic> json) =>
      _$CalendarFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}
