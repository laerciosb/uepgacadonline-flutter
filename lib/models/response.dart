import 'package:uepgacadonline_flutter/models/news_items.dart';
import 'package:uepgacadonline_flutter/models/grade.dart';
import 'package:uepgacadonline_flutter/models/news_item.dart';
import 'package:uepgacadonline_flutter/models/user.dart';
import 'package:uepgacadonline_flutter/models/weekly_menu.dart';

class Response {
  String message;
  bool status;

  NewsItems dailyNews;
  Grade grade;
  WeeklyMenu weeklyMenu;
  NewsItem news;
  User user;
  
  Response.fromJson(Map<String, dynamic> json) {
    message = json.containsKey('message') ? json['message'] : null;
    status = json.containsKey('status') ? json['status'] : null;
    
    user = json.containsKey('perfil') ? User.fromJson(json['perfil']) : null;
    news = json.containsKey('news') ? NewsItem.fromJson(json['news']) : null;
    dailyNews = json.containsKey('daily_news') ? NewsItems.fromJson(json['daily_news']) : null;
    weeklyMenu = json.containsKey('weekly_menu') ? WeeklyMenu.fromJson(json) : null;
    grade = json.containsKey('grade') ? Grade.fromJson(json['grade']) : null;
  }
}
