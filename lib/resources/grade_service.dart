import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:uepgacadonline_flutter/models/response.dart';

class GradeService {
  Client client = Client();
  final _apiKey = "97D60AD21EF6BC75FC1407861DA77FF8";

  Future<Response> fetchGrade() async {
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
