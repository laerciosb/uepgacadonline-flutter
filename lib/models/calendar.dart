import 'package:json_annotation/json_annotation.dart';
import 'package:uepgacadonline_flutter/helpers/date_helper.dart';

part 'calendar.g.dart';

@JsonSerializable()

class Calendar {
  // raw sql
  static final table = "calendar";
  static final createTable = "CREATE TABLE $table ("
      "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
      "title TEXT,"
      "date DATE,"
      "complete BIT"
      ")";

  Calendar(this.id, this.title, this.date, this.complete);

  @JsonKey(name: 'id') int id;
  @JsonKey(name: 'title') String title;
  @JsonKey(name: 'date') DateTime date;
  @JsonKey(name: 'complete') int complete;

  factory Calendar.fromJson(Map<String, dynamic> json) => _$CalendarFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}