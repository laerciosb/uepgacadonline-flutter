import 'package:uepgacadonline_flutter/models/news.dart';

class DailyNews {
  DateTime date;
  List<News> news;

  DailyNews.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    news = (json['news'] as List)?.map((i) => News.fromJson(i))?.toList();
  }
}