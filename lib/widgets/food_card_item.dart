import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uepgacadonline_flutter/widgets/card_thumbnail.dart';

class FoodCardItem extends StatelessWidget {
  final menu;

  FoodCardItem({this.menu});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(48.0, 20.0, 4.0, 0.0),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                    text: menu.day,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff4a6aff))),
                TextSpan(
                    text: DateFormat(",  dd \'d\'e MMMM \'d\'e yyyy", "pt_BR")
                        .format(menu.date),
                    style: TextStyle(fontWeight: FontWeight.w100)),
              ],
            ),
          ),
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(40.0, 4.0, 8.0, 4.0),
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    elevation: 4.0,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          Table(
                              border: TableBorder(
                                  horizontalInside:
                                      BorderSide(color: Colors.grey[100])),
                              children: List<TableRow>.from(menu.food
                                  .map((value) => _rowBuilder(value)))),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CardThumbnail(
                icon: Icon(Icons.restaurant, color: Colors.white, size: 32.0),
                color: Colors.redAccent)
          ],
        ),
      ],
    );
  }

  TableRow _rowBuilder(String value) {
    return TableRow(children: [
      Container(
          margin: EdgeInsets.only(left: 32.0),
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(value,
                    textAlign: TextAlign.left),
              )
            ],
          ))
    ]);
  }
}
