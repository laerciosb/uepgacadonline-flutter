import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Icon icon;
  final Text title;
  final Widget description;
  final Function onTap;

  BaseCard(this.icon, this.title, this.description, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(48.0, 48.0, 48.0, 32.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 4.0,
      child: Stack(
        children: <Widget>[
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                title,
                SizedBox(height: 16.0),
                SingleChildScrollView(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: description),
                )
              ]),
          InkWell(borderRadius: BorderRadius.circular(16.0), onTap: onTap)
        ],
      ),
    );
  }
}
