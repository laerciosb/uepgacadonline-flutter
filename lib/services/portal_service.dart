import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' show Client;
import 'package:uepgacadonline_flutter/models/response.dart';

class PortalService {
  Client client = Client();

  Future<Response> fetchNewsItems(int page) async {
    final response = await client.get("http://104.197.53.11/portal/news_items?page="+page.toString());

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }

  Future<Response> fetchNewsItem(String cod) async {
    final response = await client.get("http://104.197.53.11/portal/news_item?cod="+cod);

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}
