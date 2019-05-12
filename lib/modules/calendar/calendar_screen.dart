import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';
import 'package:uepgacadonline_flutter/modules/calendar/bloc.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final _calendarBloc = CalendarBloc();

  @override
  initState() {
    super.initState();
    _calendarBloc.dispatch(CalendarFetch());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        _buildTableCalendar(),
        BlocBuilder(
            bloc: _calendarBloc,
            builder: (context, CalendarState state) {
              if (state is CalendarUninitialized) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is CalendarLoaded) {
                if (state.calendar.isEmpty) {
                  return Center(
                    child: Text('Empty'),
                  );
                }
                return _buildTableCalendarList(state.calendar);
              }

              if (state is CalendarError) {
                return Center(
                  child: Text('Error'),
                );
              }
            })
      ],
    ));
  }

//  void showCalendarDialog(BuildContext context) {
//    showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            title: Text("Nova atividade"),
//            content: Column(children: <Widget>[Text("Form")]),
//            actions: <Widget>[
//              FlatButton(
//                child: Text("Cancelar"),
//                onPressed: () {
//                  Navigator.of(context).pop();
//                },
//              ),
//              FlatButton(child: Text("Inserir"))
//            ],
//          );
//        });
//  }

  Widget _buildTableCalendarList(List<Calendar> calendar) {
    return Expanded(
      child: ListView.builder(
          itemCount: calendar.length,
          itemBuilder: (context, index) =>
              _buildTableCalendarListItem(calendar[index])),
    );
  }

  Widget _buildTableCalendarListItem(Calendar calendar) {
    return Card(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[Text(calendar.title)],
            ),
          ),
          Positioned.fill(
              child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () => {},
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildTableCalendar() {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0)),
      child: TableCalendar(
        locale: 'pt_BR',
        //events: _visibleEvents,
        //holidays: _visibleHolidays,
        initialCalendarFormat: CalendarFormat.month,
        formatAnimation: FormatAnimation.slide,
        startingDayOfWeek: StartingDayOfWeek.monday,
        availableGestures: AvailableGestures.all,
        availableCalendarFormats: const {
          CalendarFormat.month: '',
        },
        calendarStyle: CalendarStyle(
          selectedColor: Color(0xff4a6aff),
          todayColor: Colors.blue[200],
          markersColor: Colors.blue[700],
        ),
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonTextStyle:
              TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
          formatButtonDecoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
//      onDaySelected: _onDaySelected,
//      onVisibleDaysChanged: _onVisibleDaysChanged,
      ),
    );
  }
}
