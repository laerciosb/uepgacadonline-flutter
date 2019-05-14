import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/enums/discipline_card_item_type.dart';
import 'package:uepgacadonline_flutter/widgets/card_thumbnail.dart';

class DisciplineCardItem extends StatelessWidget {
  final discipline;
  final type;

  DisciplineCardItem({this.discipline, this.type});

  @override
  Widget build(BuildContext context) {
    var rows;
    switch (type) {
      case DisciplineCardItemType.summary:
        rows = [
          {
            'title': '1° Semestre',
            'value': discipline.grade1?.toString() ?? '?'
          },
          {
            'title': '2° Semestre',
            'value': discipline.grade2?.toString() ?? '?'
          },
          {'title': 'Exame', 'value': discipline.gradeE?.toString() ?? '?'},
          {'title': 'Média', 'value': discipline.mean?.toString() ?? '?'},
          {'title': 'Faltas', 'value': discipline.absences?.toString() ?? '?'},
          {
            'title': 'Frequência',
            'value': "${discipline.frequency?.toString()}%" ?? '?'
          },
        ];
        break;
      case DisciplineCardItemType.complete:
        rows = [
          {'title': 'Código', 'value': discipline.cod.toString()},
          {'title': 'Faltas', 'value': discipline.absences.toString()},
          {'title': 'Turma', 'value': discipline.className.toString()},
          {'title': 'Calendário', 'value': discipline.year.toString()},
          {
            'title': 'Aulas Previstas',
            'value': discipline.plannedClasses?.toString() ?? '?'
          },
          {
            'title': 'Aulas Dadas',
            'value': discipline.givenClasses?.toString() ?? '?'
          },
          {'title': 'Faltas', 'value': discipline.absences?.toString() ?? '?'},
          {
            'title': '1° Semestre',
            'value': discipline.grade1?.toString() ?? '?'
          },
          {
            'title': '2° Semestre',
            'value': discipline.grade2?.toString() ?? '?'
          },
          {'title': 'Exame', 'value': discipline.gradeE?.toString() ?? '?'},
          {'title': 'Média', 'value': discipline.mean?.toString() ?? '?'},
          {
            'title': 'Frequência',
            'value': discipline.frequency?.toString() ?? '?'
          },
          {'title': 'Estado', 'value': discipline.status?.toString() ?? '?'},
        ];
        break;
    }

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
                    text: discipline.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color(0xff4a6aff))),
                TextSpan(
                    text: ", (${discipline.cod})",
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
                            flex: 100),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            CardThumbnail(
                icon:
                    Icon(discipline.iconData, color: Colors.white, size: 32.0),
                color: discipline.color)
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
