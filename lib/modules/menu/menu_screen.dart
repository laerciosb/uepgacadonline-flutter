import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/models/menu.dart';
import 'package:uepgacadonline_flutter/modules/menu/bloc.dart';
import 'package:uepgacadonline_flutter/widgets/food_card_item.dart';

class WeeklyMenuScreen extends StatefulWidget {
  @override
  _WeeklyMenuScreenState createState() => _WeeklyMenuScreenState();
}

class _WeeklyMenuScreenState extends State<WeeklyMenuScreen> {
  final _menuBloc = MenuBloc();

  @override
  void initState() {
    super.initState();
    _menuBloc.dispatch(MenuFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Color(0xff4a6aff)),
          title: Text("Restaurante",
              style: TextStyle(
                  fontSize: 14.0,
                  color: Color(0xff4a6aff),
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white),
      body: BlocBuilder(
        bloc: _menuBloc,
        builder: (context, MenuState state) {
          if (state is MenuUninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is MenuLoaded) {
            return ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: state.menu.length,
                itemBuilder: (context, index) =>
                    FoodCardItem(menu: state.menu[index]));
          }

          if (state is MenuError) {
            return Center(
              child: Text('Error'),
            );
          }
        },
      ),
    );
  }
}
