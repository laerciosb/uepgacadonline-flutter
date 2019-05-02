import 'package:uepgacadonline_flutter/models/news.dart';

class NewsItems {
  DateTime date;
  List<News> news;

  NewsItems.fromJson(Map<String, dynamic> json) {
//    date = DateTime.parse(json['date']);
    news = (json['news'] as List)?.map((i) => News.fromJson(i))?.toList();
  }
}