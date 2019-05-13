import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/repositories/user_repository.dart';

class AcadOnlineService {
  Client client = Client();
  String prefix = "http://104.197.53.11/acadonline";

  Future<Response> fetchGrade() async {
    final _apiKey = await userRepository.getToken();

    final response = await client.get("$prefix/grade", headers: {'x-api-token': _apiKey}, );

    return response.statusCode == 200
        ? Response.fromJson(json.decode(response.body))
        : throw Exception('Erro ao realizar requisição');
  }

  Future<Response> fetchActivities() async {
    final _apiKey = await userRepository.getToken();

    final response = await client.get("$prefix/activities", headers: {'x-api-token': _apiKey});

    return response.statusCode == 200
        ? Response.fromJson(json.decode(response.body))
        : throw Exception('Erro ao realizar requisição');
  }
}
