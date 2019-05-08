import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/authentication_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_screen.dart';
import 'package:uepgacadonline_flutter/modules/menu/menu_screen.dart';
import 'package:uepgacadonline_flutter/modules/news_items/news_items_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedItem = 0;

  Widget _bottomNavigationBarItem(int index) {
    return [NewsItemsScreen(), GradeScreen(), WeeklyMenuScreen()][index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: _buildDrawer(),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedItem,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  title: Text("Notícias"), icon: Icon(Icons.note)),
              BottomNavigationBarItem(
                  title: Text("Notas"), icon: Icon(Icons.grade)),
              BottomNavigationBarItem(
                  title: Text("Restaurante"), icon: Icon(Icons.restaurant))
            ]),
        body: _bottomNavigationBarItem(_selectedItem));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  Widget _buildDrawer() {
    final AuthenticationBloc authenticationBloc =
        BlocProvider.of<AuthenticationBloc>(context);

    return Drawer(
        child: Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.fromLTRB(24.0, 64.0, 24.0, 64.0),
        children: <Widget>[
          Text("Paulo Alves", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          Text("14147326"),
          Divider(height: 16),
          ListTile(
              leading: Icon(Icons.insert_drive_file),
              title: Text("Arquivos"),
              onTap: () {

              }),
          ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Atividades"),
              onTap: () {

              }),
          ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("Calendário"),
              onTap: () {

              }),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair"),
              onTap: () {
                authenticationBloc.dispatch(LoggedOut());
              })
        ],
      ),
    ));
  }
}
