import 'package:flutter/material.dart';

class CardThumbnail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xff4a6aff),
              borderRadius: BorderRadius.circular(32.0)),
          alignment: Alignment.centerLeft,
          height: 64.0,
          width: 64.0,
          child: Container(
              alignment: Alignment.center,
              child: Icon(Icons.collections_bookmark, color: Colors.white)),
        ),
      ],
    );
  }
}
