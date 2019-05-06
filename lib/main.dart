import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_screen.dart';
import 'package:uepgacadonline_flutter/modules/home/home_screen.dart';
import 'package:uepgacadonline_flutter/modules/login/login_screen.dart';
import 'package:uepgacadonline_flutter/modules/news_items/news_items_screen.dart';
import 'package:uepgacadonline_flutter/modules/splash/splash_screen.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final _authenticationBloc = AuthenticationBloc();

  @override
  void initState() {
    super.initState();
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  void dispose() {
    super.dispose();
    _authenticationBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _authenticationBloc,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
//      home: WeeklyMenuScreen(title: 'Ru'),
//      home: GradeScreen(title: 'Notas'),
//        home: NewsItemsScreen(title: 'News')
//      home: HomeScreen(title: 'Home')
          home: BlocBuilder(
            bloc: _authenticationBloc,
            builder: (context, AuthenticationState state) {
              if(state is AuthenticationUninitialized) {
                return SplashScreen();
              }

              if(state is AuthenticationAuthenticated) {
                return GradeScreen(title: "Notas");
              }

              return LoginScreen();
            }
          )
      ),
    );
  }
}
