import 'package:flutter/material.dart';

class CardThumbnail extends StatelessWidget {
  final Icon icon;
  final Color color;

  CardThumbnail({this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(32.0)),
          alignment: Alignment.centerLeft,
          height: 64.0,
          width: 64.0,
          child: Container(
              alignment: Alignment.center,
              child: icon),
        ),
      ],
    );
  }
}
