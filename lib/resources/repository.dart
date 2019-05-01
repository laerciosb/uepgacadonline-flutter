import 'dart:async';

import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/resources/grade_service.dart';
import 'package:uepgacadonline_flutter/resources/news_service.dart';
import 'package:uepgacadonline_flutter/resources/ru_service.dart';

class Repository {
  final gradeService = GradeService();
  final ruService = RuService();
  final newsService = NewsService();

  Future<Response> fetchGrade() => gradeService.fetchGrade();
  Future<Response> fetchWeeklyMenu() => ruService.fetchWeeklyMenu();
  Future<Response> fetchNewsItems() => newsService.fetchNewsItems();
  Future<Response> fetchNewsItem(String cod) => newsService.fetchNewsItem(cod);
}