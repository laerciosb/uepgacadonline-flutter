import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uepgacadonline_flutter/models/category.dart';
import 'package:uepgacadonline_flutter/repositories/category_repository.dart';

import 'bloc.dart';
import 'calendar_state.dart';

class CalendarForm extends StatefulWidget {
  final DateTime date;

  CalendarForm(this.date);

  @override
  _CalendarFormState createState() => _CalendarFormState();
}

class _CalendarFormState extends State<CalendarForm> {
  CalendarBloc _calendarBloc;

  @override
  initState() {
    super.initState();
    _calendarBloc = BlocProvider.of<CalendarBloc>(context);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  Category categorySelected;
  final TextEditingController _descriptionController = TextEditingController();

  bool get isPopulated =>
      categorySelected?.id != null && _descriptionController.text.isNotEmpty;

  bool isSubmitButtonEnabled(CalendarFormState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void _onDescriptionChanged() {
    _calendarBloc.dispatch(
      DescriptionChanged(description: _descriptionController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Category> categories = categoryRepository.all();

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
                  icon: Icon(Icons.edit),
                  labelText: 'Item',
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<Category>(
                    isExpanded: true,
                    isDense: true,
                    hint: Text("Item"),
                    value: categorySelected,
                    onChanged: (Category newValue) {
                      setState(() {
                        _calendarBloc.dispatch(ItemChanged(id: newValue.id));
                        categorySelected = newValue;
                      });
                    },
                    items: categories
                        .map<DropdownMenuItem<Category>>((Category value) {
                      return DropdownMenuItem<Category>(
                        value: value,
                        child: Text(value.name),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        ),
        TextFormField(
          controller: _descriptionController,
          keyboardType: TextInputType.multiline,
          textAlign: TextAlign.left,
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
        FlatButton(
          child: Text("Inserir"),
          onPressed: () {
            _calendarBloc.dispatch(
              SubmitItemPressed(
                  id: categorySelected.id,
                  description: _descriptionController.text,
                  date: widget.date),
            );
          },
        )
      ],
    );
  }
}
