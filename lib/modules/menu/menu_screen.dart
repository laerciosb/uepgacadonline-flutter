import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/modules/weekly_menu_bloc.dart';
import 'package:uepgacadonline_flutter/models/menu.dart';

class WeeklyMenuScreen extends StatefulWidget {
  @override
  _WeeklyMenuScreenState createState() => _WeeklyMenuScreenState();
}

class _WeeklyMenuScreenState extends State<WeeklyMenuScreen> {
  @override
  Widget build(BuildContext context) {
    weeklyMenuBloc.fetchWeeklyMenu();

    return StreamBuilder(
      stream: weeklyMenuBloc.weeklyMenu,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.menus.length,
              itemBuilder: (context, index) => _itemBuilder(
                  context,
                  index,
                  snapshot.data.menus[index]));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _itemBuilder(BuildContext context, int index, Menu menu) {
    return Container(
      child: Card(
        child: Column(
          children: menu.food.map((food) => Text(food)).toList(),
        ),
      ),
    );
  }
}
