import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:uepgacadonline_flutter/models/response.dart';
import 'package:uepgacadonline_flutter/repositories/user_repository.dart';

class GradeService {
  Client client = Client();

  Future<Response> fetchGrade() async {
    final _apiKey = await userRepository.getToken();

    print(_apiKey);

    final response = await client.get("http://104.197.53.11/acadonline/grade",
        headers: {'x-api-token': _apiKey});

    return response.statusCode == 200
        ? Response.fromJson(json.decode(response.body))
        : throw Exception('Erro');
  }
}
