import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/blocs/grade_bloc.dart';
import 'package:uepgacadonline_flutter/models/discipline.dart';

class GradeScreen extends StatefulWidget {
  GradeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GradeScreenState createState() => _GradeScreenState();
}

class _GradeScreenState extends State<GradeScreen> {
  @override
  Widget build(BuildContext context) {
    gradeBloc.fetchGrade();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder(
          stream: gradeBloc.grade,
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.disciplines.length,
                  itemBuilder: (context, index) => _itemBuilder(context, index, snapshot.data.disciplines[index]));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Widget _itemBuilder(BuildContext context, int index, Discipline discipline) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Text(discipline.name)
          ],
        ),
      ),
    );
  }
}
