import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/models/discipline.dart';

class DisciplineScreen extends StatefulWidget {
  DisciplineScreen({Key key, this.discipline}) : super(key: key);

  Discipline discipline;

  @override
  _DisciplineScreenState createState() => _DisciplineScreenState();
}

class _DisciplineScreenState extends State<DisciplineScreen> {
  @override
  Widget build(BuildContext context) {
    final discipline = widget.discipline;
    final rows = [
      {'title': 'Código', 'value': discipline.cod.toString()},
      {'title': 'Faltas', 'value': discipline.absences.toString()},
      {'title': 'Turma', 'value': discipline.className.toString()},
      {'title': 'Calendário', 'value': discipline.year.toString()},
      {
        'title': 'Aulas Previstas',
        'value': discipline.plannedClasses?.toString() ?? '-'
      },
      {
        'title': 'Aulas Dadas',
        'value': discipline.givenClasses?.toString() ?? '-'
      },
      {'title': 'Faltas', 'value': discipline.absences?.toString() ?? '-'},
      {'title': '1° Semestre', 'value': discipline.grade1?.toString() ?? '-'},
      {'title': '2° Semestre', 'value': discipline.grade2?.toString() ?? '-'},
      {'title': 'Exame', 'value': discipline.gradeE?.toString() ?? '-'},
      {'title': 'Média', 'value': discipline.mean?.toString() ?? '-'},
      {'title': 'Frequência', 'value': discipline.frequency?.toString() ?? '-'},
      {'title': 'Estado', 'value': discipline.status?.toString() ?? '-'},
    ];

    return Scaffold(
        appBar: AppBar(
            title: Text(discipline.name)),
            body: Container(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
                  child: Card(
                    elevation: 2.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.assessment, size: 32.0),
                                  onPressed: () => {}),
                              Container(
                                  child: Expanded(
                                      child: Text(discipline.name,
                                          style: TextStyle(
                                              fontSize: 14.0, fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.left)))
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Table(
                            border: TableBorder(horizontalInside: BorderSide(color: Colors.grey[300])),
                            children: rows
                                .asMap()
                                .map((index, value) => MapEntry(index, _rowBuilder(index, value['title'], value['value'])))
                                .values
                                .toList())
                      ],
                    ),
                  ),
                ),
              ),
            )
    );
  }

  TableRow _rowBuilder(int index, String title, String value) {
    return TableRow(children: [
      Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: index % 2 == 0 ? Colors.grey[50] : Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w700)),
            ],
          )),
      Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: index % 2 == 0 ? Colors.grey[50] : Colors.white),
          child: Text(value, textAlign: TextAlign.center)),
    ]);
  }
}
