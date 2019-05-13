import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/widgets/base_card.dart';

class ErrorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
