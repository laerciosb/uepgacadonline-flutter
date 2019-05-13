import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Text description;

  BaseCard(this.icon, this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(48.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)),
      elevation: 4.0,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Flexible(
                child: title),
            SizedBox(height: 16.0),
            Flexible(
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.0),
                    child: description))
          ]),
    );
  }
}
