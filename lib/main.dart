import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/modules/grade/grade_screen.dart';
import 'package:uepgacadonline_flutter/modules/login/login_screen.dart';
import 'package:uepgacadonline_flutter/modules/news_items/news_items_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
//      home: WeeklyMenuScreen(title: 'Ru'),
//      home: GradeScreen(title: 'Notas'),
        home: NewsItemsScreen(title: 'News')
//        home: LoginScreen()
    );
  }
}
