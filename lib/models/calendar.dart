import 'package:json_annotation/json_annotation.dart';

import 'package:uepgacadonline_flutter/helpers/date_helper.dart';
part 'calendar.g.dart';

@JsonSerializable()

class Calendar {
  Calendar(this.id, this.title, this.date, this.complete);

  @JsonKey(name: 'id') int id;
  @JsonKey(name: 'title') String title;
  @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime date;
  @JsonKey(name: 'complete') bool complete;

  factory Calendar.fromJson(Map<String, dynamic> json) => _$CalendarFromJson(json);
  Map<String, dynamic> toJson() => _$CalendarToJson(this);
}