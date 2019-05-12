import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/about/about_screen.dart';
import 'package:uepgacadonline_flutter/modules/activities/activities_screen.dart';
import 'package:uepgacadonline_flutter/modules/authentication/authentication_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/calendar/calendar_screen.dart';
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

  @override
  initState() {
    super.initState();
    _homeBloc.dispatch(HomeFetch());
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            iconTheme: IconThemeData(color: Color(0xff4a6aff)),
            bottom: TabBar(
                indicatorColor: Color(0xff4a6aff),
                unselectedLabelColor: Colors.grey[400],
                labelColor: Color(0xff4a6aff),
                tabs: [
                  Tab(text: "Notícias", icon: Icon(Icons.library_books)),
                  Tab(text: "Notas", icon: Icon(Icons.collections_bookmark)),
                  Tab(text: "Calendário", icon: Icon(Icons.insert_invitation))
                ]),
            backgroundColor: Colors.white,
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.info, color: Colors.grey[400]),
//              onPressed: () => {}
//            ),
//            IconButton(
//              icon: Icon(Icons.notifications, color: Colors.grey[400]),
//              onPressed: () => {}
//            )
//          ],
            title: Row(children: <Widget>[
              Text("Acadêmico",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xff4a6aff),
                      fontWeight: FontWeight.bold)),
              Text(" Online",
                  style: TextStyle(fontSize: 16.0, color: Color(0xff4a6aff)))
            ]),
          ),
          floatingActionButton: 0 == 2
              ? FloatingActionButton(
                  onPressed: () => {},
                  child: Icon(Icons.add),
                )
              : null,
          drawer: _buildDrawer(),
          body: TabBarView(
            children: <Widget>[
              NewsItemsScreen(),
              GradeScreen(),
              CalendarScreen()
            ],
          )),
    );
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
                      leading: Icon(Icons.assignment),
                      title: Text("Atividades"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActivitiesScreen()));
                      }),
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
                    leading: Icon(Icons.info),
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
