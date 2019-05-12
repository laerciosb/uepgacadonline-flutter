import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uepgacadonline_flutter/helpers/string_helper.dart';
import 'package:uepgacadonline_flutter/widgets/card_thumbnail.dart';

class ActivityCardItem extends StatelessWidget {
  final activity;

  ActivityCardItem({this.activity});

  @override
  Widget build(BuildContext context) {
    final rows = [
      {'title': 'Protocólo', 'value': activity.protocol.toString() ?? '?'},
      {
        'title': 'Tempo',
        'value':
            '${(activity.hours?.toString() ?? '?')} horas ${(int.parse(activity.minutes ?? 0) > 0 ? activity.hours.toString() : "")}'
      },
    ];

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
                    text: capitalize(DateFormat("EEEE", "pt_BR").format(activity.date)),
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff4a6aff))),
                TextSpan(
                    text: DateFormat(",  dd \'d\'e MMMM \'d\'e yyyy", "pt_BR")
                        .format(activity.date),
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
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(24.0, 16.0, 8.0, 16.0),
                              child: Column(
                                children: <Widget>[
                                  Table(
                                      border: TableBorder(
                                          horizontalInside: BorderSide(
                                              color: Colors.grey[100])),
                                      children: List<TableRow>.from(rows
                                          .asMap()
                                          .map((index, value) =>
                                              MapEntry<int, TableRow>(
                                                  index,
                                                  _rowBuilder(
                                                      index,
                                                      value['title'],
                                                      value['value'])))
                                          .values)),
                                  SizedBox(height: 8.0),
                                ],
                              ),
                            ),
                            flex: 100)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CardThumbnail(
                icon: Icon(Icons.timer, color: Colors.white, size: 32.0),
                color: Color(0xff4a6aff))
          ],
        ),
      ],
    );
  }

  TableRow _rowBuilder(int index, String title, String value) {
    return TableRow(children: [
      Container(
          margin: EdgeInsets.only(left: 8.0),
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(title,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.w100)),
              ),
              Expanded(
                child: Text(value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff4a6aff))),
              )
            ],
          ))
    ]);
  }
}
