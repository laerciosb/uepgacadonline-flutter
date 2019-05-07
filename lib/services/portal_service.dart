import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:http/http.dart' show Client;
import 'package:uepgacadonline_flutter/models/response.dart';

class PortalService {
  Client client = Client();

  Future<Response> fetchNewsItems(DateTime date) async {
    final dateFormatted = DateFormat('dd/MM/yyyy').format(date);

    print(dateFormatted);

    final response = await client.get("http://104.197.53.11/portal/newsitem?date=06/05/2019");

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }

  Future<Response> fetchNewsItem(String cod) async {
    final response = await client.get("http://104.197.53.11/portal/news?cod="+cod);

    if (response.statusCode == 200) {
      return Response.fromJson(json.decode(response.body));
    } else {
      throw Exception('Erro');
    }
  }
}
