import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/widgets/about_card.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xff4a6aff)),
        title: Text("Sobre",
            style: TextStyle(
                fontSize: 14.0,
                color: Color(0xff4a6aff),
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: AboutCard(),
      ),
    );
  }
}
