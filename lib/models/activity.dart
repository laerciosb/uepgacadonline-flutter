import 'package:json_annotation/json_annotation.dart';

import 'package:uepgacadonline_flutter/helpers/date_helper.dart';
part 'activity.g.dart';

@JsonSerializable()

class Activity {

  Activity(this.date, this.hours, this.minutes, this.protocol);

  @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime date;
  @JsonKey(name: 'hours') String hours;
  @JsonKey(name: 'minutes') String minutes;
  @JsonKey(name: 'protocol') String protocol;

  factory Activity.fromJson(Map<String, dynamic> json) => _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);
}