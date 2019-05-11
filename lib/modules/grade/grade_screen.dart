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
                  itemBuilder: (context, index) =>
                      _itemBuilder(context, index, state.disciplines[index]));
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
      {'title': '1° Semestre', 'value': discipline.grade1?.toString() ?? '?'},
      {'title': '2° Semestre', 'value': discipline.grade2?.toString() ?? '?'},
      {'title': 'Exame', 'value': discipline.gradeE?.toString() ?? '?'},
      {'title': 'Média', 'value': discipline.mean?.toString() ?? '?'},
      {'title': 'Faltas', 'value': discipline.absences?.toString() ?? '?'},
      {
        'title': 'Frequência',
        'value': "${discipline.frequency?.toString()}%" ?? '?'
      },
    ];

    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(48.0, 16.0, 4.0, 0.0),
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
              margin: EdgeInsets.fromLTRB(44.0, 4.0, 8.0, 4.0),
              child: Column(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0)),
                    elevation: 4.0,
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DisciplineScreen(discipline: discipline)));
                      },
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
                                        children: rows
                                            .asMap()
                                            .map((index, value) => MapEntry(
                                                index,
                                                _rowBuilder(
                                                    index,
                                                    value['title'],
                                                    value['value'])))
                                            .values
                                            .toList()),
                                    SizedBox(height: 8.0),
                                  ],
                                ),
                              ),
                              flex: 100),
                          Flexible(
                              child: Container(
                                  child: Icon(Icons.keyboard_arrow_right,
                                      size: 20.0, color: Color(0xff4a6aff))),
                              flex: 15)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CardThumbnail(
                icon: Icon(discipline.iconData, color: Colors.white, size: 32.0),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w100)),
            ],
          )),
      Container(
          padding: EdgeInsets.all(8.0),
          child: Text(value,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xff4a6aff)))),
    ]);
  }
}
