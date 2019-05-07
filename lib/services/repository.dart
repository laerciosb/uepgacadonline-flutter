import 'dart:async';

import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/services/grade_service.dart';
import 'package:uepgacadonline_flutter/services/home_service.dart';
import 'package:uepgacadonline_flutter/services/login_service.dart';
import 'package:uepgacadonline_flutter/services/portal_service.dart';
import 'package:uepgacadonline_flutter/services/ru_service.dart';

class Repository {
  final gradeService = GradeService();
  final ruService = RuService();
  final newsService = PortalService();
  final loginService = LoginService();
  final homeService = HomeService();

  Future<Response> fetchHome() => homeService.fetchHome();
  Future<Response> fetchGrade() => gradeService.fetchGrade();
  Future<Response> fetchWeeklyMenu() => ruService.fetchWeeklyMenu();
  Future<Response> fetchNewsItems(DateTime date) => newsService.fetchNewsItems(date);
  Future<Response> fetchNewsItem(String cod) => newsService.fetchNewsItem(cod);

  Future<Response> doLogin(String login, String password) => loginService.doLogin(login, password);
}