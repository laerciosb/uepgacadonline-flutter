import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/modules/authentication/bloc.dart';
import 'package:uepgacadonline_flutter/modules/home/home_screen.dart';
import 'package:uepgacadonline_flutter/modules/login/login_screen.dart';
import 'package:uepgacadonline_flutter/modules/splash/splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void main() {
  initializeDateFormatting("pt_BR", null).then((_) => runApp(App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid =
    new AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    authenticationBloc = AuthenticationBloc();
    authenticationBloc.dispatch(AppStarted());
  }

  Future onSelectNotification(String payload) async {
    showDialog(
      context: context,
      builder: (_) {},
    );
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
            primarySwatch: Colors.indigo,
          ),
          home: BlocBuilder(
              bloc: authenticationBloc,
              builder: (context, AuthenticationState state) {
                if (state is AuthenticationUninitialized) {
                  return SplashScreen();
                }

                if (state is AuthenticationAuthenticated) {
                  return HomeScreen(title: "");
                }

                return LoginScreen();
              })),
    );
  }
}
