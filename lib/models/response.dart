import 'package:uepgacadonline_flutter/models/daily_news.dart';
import 'package:uepgacadonline_flutter/models/grade.dart';
import 'package:uepgacadonline_flutter/models/menu.dart';
import 'package:uepgacadonline_flutter/models/news.dart';
import 'package:uepgacadonline_flutter/models/weekly_menu.dart';

class Response {
  String message;
  bool status;

  DailyNews dailyNews;
  Grade grade;
  WeeklyMenu weeklyMenu;
  News news;

  Response.fromJson(Map<String, dynamic> json) {
    message = json.containsKey('message') ? json['message'] : null;
    status = json.containsKey('status') ? json['status'] : null;

    news = json.containsKey('news') ? News.fromJson(json['news']) : null;
    dailyNews = json.containsKey('daily_news') ? DailyNews.fromJson(json['daily_news']) : null;
    weeklyMenu = json.containsKey('weekly_menu') ? WeeklyMenu.fromJson(json) : null;
    grade = json.containsKey('grade') ? Grade.fromJson(json['grade']) : null;
  }
}