import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/blocs/weekly_menu_bloc.dart';
import 'package:uepgacadonline_flutter/models/menu.dart';

class WeeklyMenuScreen extends StatefulWidget {
  WeeklyMenuScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WeeklyMenuScreenState createState() => _WeeklyMenuScreenState();
}

class _WeeklyMenuScreenState extends State<WeeklyMenuScreen> {
  @override
  Widget build(BuildContext context) {
    weeklyMenuBloc.fetchWeeklyMenu();

    final values = [
      {'day': 'Seg', 'date': '22/04'},
      {'day': 'Ter', 'date': '23/04'},
      {'day': 'Qua', 'date': '24/04'},
      {'day': 'Qui', 'date': '25/04'},
      {'day': 'Sex', 'date': '26/04'},
      {'day': 'Sáb', 'date': '27/04'},
    ];

    return DefaultTabController(
      length: values.length,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: TabBar(
              tabs: values.map((value) {
                var index = values.indexOf(value);

                return Center(
                    child: Column(
                  children: <Widget>[
//                    Icon(Icons.restaurant_menu, size: index == index ? 12.0 : 10.0),
                    Text(value['day'], style: TextStyle(fontSize: 15.0)),
                    Text(value['date'], style: TextStyle(fontSize: 10.0)),
                  ],
                ));
              }).toList(),
            ),
          ),
          body: TabBarView(
              children: values
                  .map((value) => Container(
                        child: StreamBuilder(
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
                        ),
                      ))
                  .toList())),
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
