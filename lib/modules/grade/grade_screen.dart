import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/models/discipline.dart';
import 'package:uepgacadonline_flutter/modules/discipline/discipline_screen.dart';
import 'package:uepgacadonline_flutter/modules/grade/bloc.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_state.dart';
import 'package:uepgacadonline_flutter/widgets/card_thumbnail.dart';

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
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: BlocBuilder(
          bloc: _gradeBloc,
          builder: (context, GradeState state) {
            if (state is GradeUninitialized) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GradeLoaded) {
              if (state.disciplines.isEmpty) {
                return Center(
                  child: Text('Empty'),
                );
              }
              return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: state.disciplines.length,
                  itemBuilder: (context, index) => _itemBuilder(
                      context, index, state.disciplines[index]));
            }

            if (state is GradeError) {
              return Center(
                child: Text('Error'),
              );
            }
          }),
    );
  }

  Widget _itemBuilder(BuildContext context, int index, Discipline discipline) {
    final rows = [
      {'title': '1° Semestre', 'value': discipline.grade1?.toString() ?? '-'},
      {'title': '2° Semestre', 'value': discipline.grade2?.toString() ?? '-'},
      {'title': 'Exame', 'value': discipline.gradeE?.toString() ?? '-'},
      {'title': 'Média', 'value': discipline.mean?.toString() ?? '-'},
      {'title': 'Faltas', 'value': discipline.absences?.toString() ?? '-'},
      {'title': 'Frequência', 'value': discipline.frequency?.toString() ?? '-'},
    ];

    return Stack(
      alignment: Alignment.centerLeft,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(48.0, index == 0 ? 16.0 : 0.0, 8.0, 8.0),
          child: Card(
            elevation: 2.0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisciplineScreen(discipline: discipline)));
              },
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
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.left)))
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Table(
                      border: TableBorder(
                          horizontalInside: BorderSide(color: Colors.grey[300])),
                      children: rows
                          .asMap()
                          .map((index, value) => MapEntry(index,
                              _rowBuilder(index, value['title'], value['value'])))
                          .values
                          .toList())
                ],
              ),
            ),
          ),
        ),
        CardThumbnail()
      ],
    );
  }

  TableRow _rowBuilder(int index, String title, String value) {
    return TableRow(children: [
      Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.grey[50] : Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ],
          )),
      Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: index % 2 == 0 ? Colors.grey[50] : Colors.white),
          child: Text(value, textAlign: TextAlign.center)),
    ]);
  }
}
