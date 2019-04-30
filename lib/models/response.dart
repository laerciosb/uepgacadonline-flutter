import 'package:uepgacadonline_flutter/models/grade.dart';
import 'package:uepgacadonline_flutter/models/menu.dart';
import 'package:uepgacadonline_flutter/models/weekly_menu.dart';

class Response {
  String message;
  bool status;

  Grade grade;
  WeeklyMenu weeklyMenu;

  Response.fromJson(Map<String, dynamic> json) {
    message = json.containsKey('message') ? json['message'] : null;
    status = json.containsKey('status') ? json['status'] : null;

    weeklyMenu = json.containsKey('weekly_menu') ? WeeklyMenu.fromJson(json) : null;
    grade = json.containsKey('grade') ? Grade.fromJson(json['grade']) : null;
  }
}