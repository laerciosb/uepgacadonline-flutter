import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/enums/discipline_card_item_type.dart';
import 'package:uepgacadonline_flutter/modules/grade/bloc.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_state.dart';
import 'package:uepgacadonline_flutter/widgets/discipline_card_item.dart';
import 'package:uepgacadonline_flutter/widgets/empty_card.dart';
import 'package:uepgacadonline_flutter/widgets/error_card.dart';

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
              return state.disciplines == null
                  ? EmptyCard(
                      "Aparentemente, a listagem de disciplinas está vazia.")
                  : ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      itemCount: state.disciplines.length,
                      itemBuilder: (context, index) => DisciplineCardItem(
                          discipline: state.disciplines[index],
                          type: DisciplineCardItemType.summary));
            }

            if (state is GradeError) {
              return ErrorCard(e: state.e);
            }
          }),
    );
  }
}
