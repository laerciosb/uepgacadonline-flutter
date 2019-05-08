import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/home/home_screen.dart';
import 'package:uepgacadonline_flutter/modules/login/login_screen.dart';
import 'package:uepgacadonline_flutter/modules/splash/splash_screen.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc = AuthenticationBloc();
    authenticationBloc.dispatch(AppStarted());
  }

  @override
  void dispose() {
    super.dispose();
    authenticationBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: authenticationBloc,
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocBuilder(
              bloc: authenticationBloc,
              builder: (context, AuthenticationState state) {
                if (state is AuthenticationUninitialized) {
                  return SplashScreen();
                }

                if (state is AuthenticationAuthenticated) {
                  return HomeScreen(title: "Home");
                }

                return LoginScreen();
              })),
    );
  }
}
