import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/widgets/base_card.dart';

class EmptyCard extends StatelessWidget {
  final String description;


  EmptyCard(this.description);

  @override
  Widget build(BuildContext context) {
    return BaseCard(
        Icon(Icons.mood_bad, size: 100.0, color: Colors.orange),
        Text("Vazio".toUpperCase(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.orange)),
        Text(
            description,
            textAlign: TextAlign.center)
    );
  }
}
