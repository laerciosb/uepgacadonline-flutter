import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:uepgacadonline_flutter/models/response.dart';

class LoginService {
  Client client = Client();

  Future<Response> doLogin(String login, String password) async {
    Map<String, dynamic> body = {'login': login, 'password': password};

    final response = await client.post("http://104.197.53.11/acadonline/login", body: body);

    print(response.body);

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}
