import 'package:flutter/material.dart';

class CalendarForm extends StatefulWidget {
  @override
  _CalendarFormState createState() => _CalendarFormState();
}

class _CalendarFormState extends State<CalendarForm> {
  @override
  Widget build(BuildContext context) {
    final categories = [
      '',
      'Apresentação',
      'Prova',
      'Trabalho',
      'Outro',
    ];

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      title: Text("Novo Item",
          style: TextStyle(color: Color(0xff4a6aff), fontSize: 16.0)),
      content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Flexible(
          child: FormField(
            builder: (FormFieldState state) {
              return InputDecorator(
                decoration: InputDecoration(
                  hasFloatingPlaceholder: false,
                  icon: const Icon(Icons.edit),
                  labelText: 'Item',
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    isDense: true,
                    hint: Text("Item"),
                    onChanged: (String newValue) {},
                    items: categories
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.multiline,
          minLines: null,
          autovalidate: true,
          decoration: InputDecoration(
              hasFloatingPlaceholder: false,
              icon: Icon(Icons.library_books, color: Colors.grey),
              labelText: 'Descrição',
              hintText: 'Descrição'),
//                validator: (_) {
//                  return !state.
//                      ? ''
//                      : null;
//                }
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
