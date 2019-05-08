import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/models/discipline.dart';
import 'package:uepgacadonline_flutter/modules/grade/bloc.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_state.dart';

class GradeScreen extends StatefulWidget {
  @override
  _GradeScreenState createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  final _gradeBloc = GradeBloc();

  @override
  initState() {
    super.initState();
    _gradeBloc.dispatch(GradeFetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _gradeBloc,
        builder: (context, GradeState state) {
          if (state is GradeUninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GradeLoaded) {
            if (state.grade == null || state.grade.disciplines.isEmpty) {
              return Center(
                child: Text('Empty'),
              );
            }
            return ListView.builder(
                itemCount: state.grade.disciplines.length,
                itemBuilder: (context, index) => _itemBuilder(
                    context, index, state.grade.disciplines[index]));
          } else if (state is GradeError) {
            return Center(
              child: Text('Error'),
            );
          }
        });
  }

  Widget _itemBuilder(BuildContext context, int index, Discipline discipline) {
    final rows = [
      {'title': 'Código', 'value': discipline.cod.toString()},
      {'title': 'Turma', 'value': discipline.className.toString()},
      {'title': '1° Semestre', 'value': discipline.grade1?.toString() ?? '-'},
      {'title': '2° Semestre', 'value': discipline.grade2?.toString() ?? '-'},
      {'title': 'Exame', 'value': discipline.gradeE?.toString() ?? '-'},
      {'title': 'Média', 'value': discipline.mean?.toString() ?? '-'},
      {'title': 'Faltas', 'value': discipline.absences?.toString() ?? '-'},
      {'title': 'Frequência', 'value': discipline.frequency?.toString() ?? '-'},
      {'title': 'Estado', 'value': discipline.status?.toString() ?? '-'},
    ];

    return Container(
      margin: EdgeInsets.fromLTRB(4.0, index == 0 ? 16.0 : 0.0, 4.0, 8.0),
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
                    .map((value) => _rowBuilder(value['title'], value['value']))
                    .toList())
          ],
        ),
      ),
    );
  }

  TableRow _rowBuilder(String title, String value) {
    return TableRow(children: [
      Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title, textAlign: TextAlign.center),
            ],
          )),
      Container(
          padding: EdgeInsets.all(8.0),
          child: Text(value, textAlign: TextAlign.center))
    ]);
  }
}
