import 'package:uepgacadonline_flutter/models/menu.dart';

class WeeklyMenu {
  List<Menu> menus;

  WeeklyMenu.fromJson(Map<String, dynamic> json) {
    menus = (json['weekly_menu'] as List)?.map((i) => Menu.fromJson(i))?.toList();
  }
}