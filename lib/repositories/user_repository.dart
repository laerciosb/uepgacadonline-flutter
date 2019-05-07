import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uepgacadonline_flutter/models/user.dart';
import 'package:uepgacadonline_flutter/services/login_service.dart';

class UserRepository {
  final _loginService = LoginService();

  Future<String> getToken() async {
    final _prefs = await SharedPreferences.getInstance();

    final now = DateTime.now();
    final lastLogin = _prefs.getString('last_login') != null ? DateTime.parse(_prefs.getString('last_login')) : null;

    if(lastLogin != null) {
      final diference = now.difference(lastLogin).inMinutes;

      if(diference > 10) {
        final login = _prefs.getString('login');
        final password = _prefs.getString('password');

        final token = await this.doLogin(login, password);
        _prefs.setString('token', token);

        return token;
      }
    }

    return _prefs.getString('token');
  }

  Future<void> clearToken() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', null);
  }

  Future<User> getUser() async {
    final _prefs = await SharedPreferences.getInstance();
    final json_ = json.decode(_prefs.getString('user'));
    final user = User.fromJson(json_) ?? null;

    return user;
  }

  Future<String> doLogin(String login, String password) async {
    final _prefs = await SharedPreferences.getInstance();
    final response = await _loginService.doLogin(login, password);

    _prefs.setString('login', login);
    _prefs.setString('password', password);
    _prefs.setString('token', response.token);
    _prefs.setString('user', json.encode(response.user));
    _prefs.setString('last_login', DateTime.now().toString());
    return response.token;
  }
}

final userRepository = UserRepository();
