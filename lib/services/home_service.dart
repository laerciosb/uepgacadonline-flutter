import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:uepgacadonline_flutter/helpers/notification_helper.dart';
import 'package:uepgacadonline_flutter/models/response.dart';

class HomeService {
  Client client = Client();

  Future<Response> fetchHome() async {
    final response = await client.get("http://104.197.53.11/acadonline/home");

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}
