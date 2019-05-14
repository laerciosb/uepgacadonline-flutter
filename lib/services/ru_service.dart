import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:uepgacadonline_flutter/models/response.dart';

class RuService {
  Client client = Client();

  Future<Response> fetchWeeklyMenu(String campus, String shift) async {
    final response = await client.get("http://104.197.53.11/ru/menu?campus=$campus&shift=$shift");

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}
