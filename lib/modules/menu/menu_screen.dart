import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/models/menu.dart';
import 'package:uepgacadonline_flutter/modules/menu/bloc.dart';

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
        title: Text("Restaurante"),
      ),
      body: BlocBuilder(
        bloc: _menuBloc,
        builder: (context, MenuState state) {
          if(state is MenuUninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if(state is MenuLoaded) {
            return ListView.builder(
                itemCount: state.menu.length,
                itemBuilder: (context, index) =>
                    _itemBuilder(context, index, state.menu[index]));
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
