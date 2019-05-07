import 'package:uepgacadonline_flutter/models/menu.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weekly_menu.g.dart';

@JsonSerializable()

class WeeklyMenu {
  WeeklyMenu(this.menus);

  @JsonKey(name: 'weekly_menu') List<Menu> menus;

  factory WeeklyMenu.fromJson(Map<String, dynamic> json) => _$WeeklyMenuFromJson(json);
  Map<String, dynamic> toJson() => _$WeeklyMenuToJson(this);
}