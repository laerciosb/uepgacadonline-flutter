import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uepgacadonline_flutter/models/response.dart';

class GradeService {
  Client client = Client();

  Future<Response> fetchGrade() async {
    final _prefs = await SharedPreferences.getInstance();
    final _apiKey = _prefs.getString('token');

    final response = await client.get(
        "http://104.197.53.11/acadonline/grade",
        headers: {'x-api-token': _apiKey});

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}
