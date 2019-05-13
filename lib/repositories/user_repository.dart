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
      final difference = now.difference(lastLogin).inMinutes;

      if(difference > 10) {
        final login = _prefs.getString('login');
        final password = _prefs.getString('password');

        final doLogin = await this.doLogin(login, password);
        _prefs.setString('token', doLogin[0]);

        return doLogin[0];
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
    final _json = json.decode(_prefs.getString('user') ?? null);

    final user = User.fromJson(_json) ?? null;

    return user;
  }

  Future<List> doLogin(String login, String password) async {
    final _prefs = await SharedPreferences.getInstance();
    final response = await _loginService.doLogin(login, password);

    _prefs.setString('login', login);
    _prefs.setString('password', password);
    _prefs.setString('token', response.token);
    _prefs.setString('user', json.encode(response.user));
    _prefs.setString('last_login', DateTime.now().toString());
    return [response.token, response.user != null];
  }

  Future<void> doLogout() async {
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('token', null);
    _prefs.setString('user', null);
  }
}

final userRepository = UserRepository();
