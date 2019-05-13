import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/activities/bloc.dart';
import 'package:uepgacadonline_flutter/widgets/activity_card_item.dart';
import 'package:uepgacadonline_flutter/widgets/empty_card.dart';
import 'package:uepgacadonline_flutter/widgets/error_card.dart';

class ActivitiesScreen extends StatefulWidget {
  @override
  _ActivitiesScreenState createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final _activitiesBloc = ActivitiesBloc();

  @override
  void initState() {
    super.initState();
    _activitiesBloc.dispatch(ActivitiesFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff4a6aff)),
        title: Text("Atividades Complementares",
            style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff4a6aff),
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: BlocBuilder(
        bloc: _activitiesBloc,
        builder: (context, ActivitiesState state) {
          if (state is ActivitiesUninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ActivitiesLoaded) {
            return state.activities.isEmpty
                ? EmptyCard("Aparentemente, a listagem de atividades está vazia.")
                : ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: state.activities.length,
                itemBuilder: (context, index) =>
                    ActivityCardItem(activity: state.activities[index]));
          }

          if (state is ActivitiesError) {
            return ErrorCard();
          }
        },
      ),
    );
  }
}
