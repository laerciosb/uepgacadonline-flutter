import 'package:json_annotation/json_annotation.dart';

import 'package:uepgacadonline_flutter/helpers/date_helper.dart';

part 'menu.g.dart';

@JsonSerializable()

class Menu {

  Menu(this.date, this.day, this.food);

  @JsonKey(name: 'date', fromJson: dateFromJson, toJson: dateToJson) DateTime date;
  @JsonKey(name: 'day') String day;
  @JsonKey(name: 'food') List<String> food;
  @JsonKey(name: 'lunch') List<String> lunch;
  @JsonKey(name: 'dinner') List<String> dinner;

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);
  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
