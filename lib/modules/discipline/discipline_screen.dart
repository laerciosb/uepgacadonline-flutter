import 'package:flutter/material.dart';
import 'package:uepgacadonline_flutter/enums/discipline_card_item_type.dart';
import 'package:uepgacadonline_flutter/widgets/discipline_card_item.dart';

class DisciplineScreen extends StatefulWidget {
  DisciplineScreen({Key key, this.discipline}) : super(key: key);

  final discipline;

  @override
  _DisciplineScreenState createState() => _DisciplineScreenState();
}

class _DisciplineScreenState extends State<DisciplineScreen> {
  @override
  Widget build(BuildContext context) {
    final discipline = widget.discipline;

    return Scaffold(
        appBar: AppBar(
            titleSpacing: 0.0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Color(0xff4a6aff)),
            title: Text(discipline.name,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Color(0xff4a6aff),
                    fontWeight: FontWeight.bold)),
            backgroundColor: Colors.white),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: DisciplineCardItem(
                discipline: discipline, type: DisciplineCardItemType.complete),
          ),
        ));
  }
}
