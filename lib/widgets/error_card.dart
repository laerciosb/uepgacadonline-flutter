import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/widgets/base_card.dart';

class ErrorCard extends StatelessWidget {
  final Exception e;

  ErrorCard({this.e});

  @override
  Widget build(BuildContext context) {
    if(e is SocketException) {
      return BaseCard(
          Icon(Icons.cloud_off, size: 100.0, color: Colors.grey),
          Text("Sem conexão".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          Text(
              "Você está sem conexão.",
              textAlign: TextAlign.center)
      );
    }

    else {
      return BaseCard(
          Icon(Icons.error_outline, size: 100.0, color: Colors.red),
          Text("Erro".toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          Text(
              "Ocorreu um erro ao realizar a operação.",
              textAlign: TextAlign.center)
      );
    }
  }
}
