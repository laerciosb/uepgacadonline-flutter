import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/models/activity.dart';
import 'package:uepgacadonline_flutter/modules/activities/bloc.dart';

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
        title: Text("Atividades Complementares"),
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
            return ListView.builder(
                itemCount: state.activities.length,
                itemBuilder: (context, index) =>
                    _itemBuilder(context, index, state.activities[index]));
          }

          if (state is ActivitiesError) {
            return Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index, Activity activity) {
    return Container(
      child: Card(
        child: Column(
            children: <Widget>[
              Text(activity.protocol),
              Text(activity.date.toString()),
              Text(activity.hours),
              Text(activity.minutes),
            ],
        ),
      ),
    );
  }
}
