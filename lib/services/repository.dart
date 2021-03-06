import 'dart:async';

import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/services/acadonline_service.dart';
import 'package:uepgacadonline_flutter/services/home_service.dart';
import 'package:uepgacadonline_flutter/services/login_service.dart';
import 'package:uepgacadonline_flutter/services/portal_service.dart';
import 'package:uepgacadonline_flutter/services/ru_service.dart';

class Repository {
  final acadOnlineService = AcadOnlineService();
  final ruService = RuService();
  final loginService = LoginService();
  final homeService = HomeService();

  Future<Response> fetchHome() => homeService.fetchHome();
  Future<Response> fetchGrade() => acadOnlineService.fetchGrade();
  Future<Response> fetchActivities() => acadOnlineService.fetchActivities();

  Future<Response> doLogin(String login, String password) =>
      loginService.doLogin(login, password);
}
