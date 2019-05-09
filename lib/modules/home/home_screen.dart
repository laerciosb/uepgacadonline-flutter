import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/about/about_screen.dart';
import 'package:uepgacadonline_flutter/modules/activities/activities_screen.dart';
import 'package:uepgacadonline_flutter/modules/authentication/authentication_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_screen.dart';
import 'package:uepgacadonline_flutter/modules/home/bloc.dart';
import 'package:uepgacadonline_flutter/modules/menu/menu_screen.dart';
import 'package:uepgacadonline_flutter/modules/news_items/news_items_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeBloc = HomeBloc();
  int _selectedItem = 0;

  Widget _bottomNavigationBarItem(int index) {
    return [NewsItemsScreen(), GradeScreen()][index];
  }

  @override
  initState() {
    super.initState();
    _homeBloc.dispatch(HomeFetch());
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

    return BlocBuilder(
        bloc: _homeBloc,
        builder: (context, HomeState state) {
          if (state is HomeUninitialized) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is HomeLoaded) {
            return Drawer(
                child: Container(
              color: Colors.white,
              child: ListView(
                padding: EdgeInsets.fromLTRB(24.0, 64.0, 24.0, 64.0),
                children: <Widget>[
                  Text(state.user?.completeName,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  Text(state.user?.academicRegister),
                  Divider(height: 16),
                  ListTile(
                      leading: Icon(Icons.insert_drive_file),
                      title: Text("Arquivos"),
                      onTap: () {}),
                  ListTile(
                      leading: Icon(Icons.assignment),
                      title: Text("Atividades"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivitiesScreen()));
                      }),
                  ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text("Calendário"),
                      onTap: () {}),
                  ListTile(
                    leading: Icon(Icons.restaurant),
                    title: Text("Restaurante"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeeklyMenuScreen()));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.supervised_user_circle),
                    title: Text("Sobre"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutScreen()));
                    },
                  ),
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

          if (state is HomeError) {
            authenticationBloc.dispatch(LoggedOut());
          }
        });
  }
}
