import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uepgacadonline_flutter/enums/food_card_item_type.dart';
import 'package:uepgacadonline_flutter/models/menu.dart';
import 'package:uepgacadonline_flutter/widgets/card_thumbnail.dart';

class FoodCardItem extends StatelessWidget {
  final Menu menu;

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
        menu.lunch != null ? _buildCard(FoodCardItemType.lunch) : Container(),
        menu.dinner != null ? _buildCard(FoodCardItemType.dinner) : Container(),
      ],
    );
  }

  Widget _buildCard(FoodCardItemType type) {
    return Stack(
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
                          children: type == FoodCardItemType.lunch
                              ? List<TableRow>.from(
                                  menu.lunch.map((value) => _rowBuilder(value)))
                              : List<TableRow>.from(menu.dinner
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
            icon: Icon(
                type == FoodCardItemType.lunch
                    ? Icons.restaurant_menu
                    : Icons.restaurant,
                color: Colors.white,
                size: 32.0),
            color:
                type == FoodCardItemType.lunch ? Colors.orange : Colors.purple)
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
                child: Text(value, textAlign: TextAlign.left),
              )
            ],
          ))
    ]);
  }
}
