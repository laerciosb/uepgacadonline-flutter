import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/enums/discipline_card_item_type.dart';
import 'package:uepgacadonline_flutter/modules/grade/bloc.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_state.dart';
import 'package:uepgacadonline_flutter/widgets/discipline_card_item.dart';

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
                  itemBuilder: (context, index) => DisciplineCardItem(
                      discipline: state.disciplines[index],
                      type: DisciplineCardItemType.summary));
            }

            if (state is GradeError) {
              return Center(
                child: Text('Error'),
              );
            }
          }),
    );
  }
}
