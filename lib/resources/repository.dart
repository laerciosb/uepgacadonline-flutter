import 'dart:async';

import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/resources/grade_service.dart';
import 'package:uepgacadonline_flutter/resources/home_service.dart';
import 'package:uepgacadonline_flutter/resources/login_service.dart';
import 'package:uepgacadonline_flutter/resources/portal_service.dart';
import 'package:uepgacadonline_flutter/resources/ru_service.dart';

class Repository {
  final gradeService = GradeService();
  final ruService = RuService();
  final newsService = PortalService();
  final loginService = LoginService();
  final homeService = HomeService();

  Future<Response> fetchHome() => homeService.fetchHome();
  Future<Response> fetchGrade() => gradeService.fetchGrade();
  Future<Response> fetchWeeklyMenu() => ruService.fetchWeeklyMenu();
  Future<Response> fetchNewsItems() => newsService.fetchNewsItems();
  Future<Response> fetchNewsItem(String cod) => newsService.fetchNewsItem(cod);

  Future<Response> doLogin(String login, String password) => loginService.doLogin(login, password);
}