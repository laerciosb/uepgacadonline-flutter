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
    return Card(
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.add),
                Text(discipline.name)
              ],
            ),
            Table(
              children: <TableRow>[
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey
                  ),
                  children: [
                    Text("Avaliação"),
                    Text("Nota"),
                    Text("Faltas"),
                    Text("Frequência")
                  ]
                ),
                TableRow(
                  children: [
                    Text("1 Semestre"),
                    Text("8.0"),
                    Text("30"),
                    Text("80%")
                  ]
                ),
                TableRow(
                    children: [
                      Text("2 Semestre"),
                      Text("8.0"),
                      Text("30"),
                      Text("80%")
                    ]
                ),
                TableRow(
                    children: [
                      Text("Exame"),
                      Text("8.0"),
                      Text("30"),
                      Text("80%")
                    ]
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
