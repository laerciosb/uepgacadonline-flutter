import 'package:flutter/material.dart';

class CalendarForm extends StatefulWidget {
  @override
  _CalendarFormState createState() => _CalendarFormState();
}

class _CalendarFormState extends State<CalendarForm> {
  @override
  Widget build(BuildContext context) {
    final categories = [
      'Apresentação',
      'Prova',
      'Trabalho',
      'Outro',
    ];

    return AlertDialog(
      title: Text("Novo Item", style: TextStyle(color: Color(0xff4a6aff))),
      content: Column(children: <Widget>[
        DropdownButton<String>(
          onChanged: (String newValue) {

          },
          items: categories.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          })
              .toList(),
        )
      ]),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(child: Text("Inserir"))
      ],
    );
  }
}
