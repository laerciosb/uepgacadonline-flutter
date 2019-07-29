import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/about/about_screen.dart';
import 'package:uepgacadonline_flutter/modules/activities/activities_screen.dart';
import 'package:uepgacadonline_flutter/modules/authentication/authentication_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/calendar/bloc.dart';
import 'package:uepgacadonline_flutter/modules/calendar/calendar_screen.dart';
import 'package:uepgacadonline_flutter/modules/chat/chat_screen.dart';
import 'package:uepgacadonline_flutter/modules/contact/contact_screen.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_screen.dart';
import 'package:uepgacadonline_flutter/modules/home/bloc.dart';
import 'package:uepgacadonline_flutter/modules/map/map_screen.dart';
import 'package:uepgacadonline_flutter/modules/menu/menu_screen.dart';
import 'package:uepgacadonline_flutter/modules/news_items/news_items_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.bloc}) : super(key: key);

  final AuthenticationBloc bloc;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeBloc _homeBloc;
  TabController _tabController;

  @override
  initState() {
    super.initState();
    _homeBloc = HomeBloc();
    _homeBloc.dispatch(HomeFetch());
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(_handleTabIndex);
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _homeBloc.dispose();
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          iconTheme: IconThemeData(color: Color(0xff4a6aff)),
          bottom: TabBar(
              controller: _tabController,
              indicatorColor: Color(0xff4a6aff),
              unselectedLabelColor: Colors.grey[400],
              labelColor: Color(0xff4a6aff),
              tabs: [
                Tab(text: "Notícias", icon: Icon(Icons.library_books)),
                Tab(text: "Notas", icon: Icon(Icons.collections_bookmark)),
                Tab(text: "Calendário", icon: Icon(Icons.insert_invitation))
              ]),
          backgroundColor: Colors.white,
          title: BlocBuilder(
              bloc: _homeBloc,
              builder: (context, HomeState state) {
                if (state is HomeLoaded) {
                  return Row(children: <Widget>[
                    Flexible(
                      flex: 10,
                      child: Text(state.user.completeName,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Color(0xff4a6aff),
                              fontWeight: FontWeight.bold)),
                    ),
                    Flexible(
                      flex: 6,
                      child: Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: Text(" ${state.user.academicRegister}",
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.black)),
                      ),
                    )
                  ]);
                } else {
                  return Container();
                }
              }),
        ),
        drawer: _buildDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            NewsItemsScreen(),
            GradeScreen(),
            CalendarScreen()
          ],
        ),
        floatingActionButton: _buildFloatingButton(),
        resizeToAvoidBottomPadding: false);
  }

  Widget _buildDrawer() {
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
                          color: Color(0xff4a6aff),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold)),
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
                      leading: Icon(Icons.insert_invitation),
                      title: Text("Calendário"),
                      onTap: () {
                        _tabController.index = 2;
                        Navigator.pop(context);
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
                      leading: Icon(Icons.collections_bookmark),
                      title: Text("Notas"),
                      onTap: () {
                        _tabController.index = 1;
                        Navigator.pop(context);
                      }),
                  ListTile(
                      leading: Icon(Icons.library_books),
                      title: Text("Notícias"),
                      onTap: () {
                        _tabController.index = 0;
                        Navigator.pop(context);
                      }),
                  ListTile(
                    leading: Icon(Icons.message),
                    title: Text("Chat"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen()));
                    },
                  ),
                  ListTile(
                      leading: Icon(Icons.map),
                      title: Text("Mapa"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MapScreen()));
                      }),
                  ListTile(
                      leading: Icon(Icons.perm_device_information),
                      title: Text("Contato"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactScreen()));
                      }),
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
                        print("logout tap");
                        widget.bloc.dispatch(LoggedOut());
                      })
                ],
              ),
            ));
          }

          if (state is HomeError) {
            widget.bloc.dispatch(LoggedOut());
          }
        });
  }

  Widget _buildFloatingButton() {
    return _tabController.index == 2
        ? Align(
            child: FloatingActionButton(
              backgroundColor: Color(0xff4a6aff),
              onPressed: () {
                BlocProvider.of<CalendarBloc>(context)
                    .dispatch(CalendarOpenDialog());
              },
              child: Icon(Icons.add),
            ),
            alignment: Alignment(1, 1))
        : Container();
  }
}
