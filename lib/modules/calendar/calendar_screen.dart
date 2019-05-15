import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uepgacadonline_flutter/helpers/date_helper.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';
import 'package:uepgacadonline_flutter/modules/calendar/bloc.dart';
import 'package:uepgacadonline_flutter/modules/calendar/calendar_form.dart';
import 'package:uepgacadonline_flutter/widgets/card_thumbnail.dart';
import 'package:uepgacadonline_flutter/widgets/error_card.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarBloc _calendarBloc;
  DateTime date = DateTime.now();

  @override
  initState() {
    super.initState();
    _calendarBloc = BlocProvider.of<CalendarBloc>(context);
    _calendarBloc.dispatch(CalendarFetch(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: _calendarBloc,
        listener: (context, state) {
          if (state is CalendarDialog) {
            showCalendarDialog(context);
          }
        },
        child: Container(
          child: BlocBuilder(
              bloc: _calendarBloc,
              builder: (context, CalendarState state) {
                if (state is CalendarUninitialized) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is CalendarLoaded) {
                  if (state.calendar.isEmpty) {
                    return SingleChildScrollView(
                        child: Column(
                      children: <Widget>[
                        _buildTableCalendar(),
                      ],
                    ));
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        _buildTableCalendar(),
                        _buildTableCalendarList(state.calendar),
                      ],
                    ),
                  );
                }

                if (state is CalendarError) {
                  return ErrorCard();
                }
              }),
        ));
  }

  void showCalendarDialog(BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext context) => CalendarForm(date));
  }

  Widget _buildTableCalendarList(List<Calendar> calendar) {
    return ListView.builder(
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 100.0),
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: calendar.length,
        itemBuilder: (context, index) =>
            _buildTableCalendarListItem(context, index, calendar[index]));
  }

  Widget _buildTableCalendarListItem(
      BuildContext context, int index, Calendar calendar) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 48.0, top: index == 0 ? 4.0 : 16.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Text(calendar.category.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: calendar.category.color)),
              ),
            ],
          ),
        ),
        Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            _itemCard(calendar),
            CardThumbnail(
                icon: Icon(calendar.category.iconData, color: Colors.white),
                color: calendar.category.color)
          ],
        ),
      ],
    );
  }

  Widget _itemCard(Calendar calendar) {
    return Container(
      child: Card(
          margin: EdgeInsets.fromLTRB(48.0, 4.0, 8.0, 4.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
          elevation: 4.0,
          child: _itemCardContent(calendar)),
    );
  }

  Widget _itemCardContent(Calendar calendar) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(24.0, 16.0, 8.0, 16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(calendar.title, textAlign: TextAlign.left),
                  ],
                ),
                SizedBox(height: 8.0),
                _itemCardInfo(calendar),
              ],
            ),
          ),
          flex: 100,
        ),
        Flexible(
            child: Container(
                child: IconButton(
                    icon: Icon(Icons.close, size: 20.0, color: Colors.red),
                    onPressed: () =>
                        {_calendarBloc.dispatch(DeleteItem(calendar.id))})),
            flex: 25)
      ],
    );
  }

  Widget _itemCardInfo(Calendar calendar) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      Icon(Icons.access_time, size: 12.0, color: Colors.grey[400]),
      SizedBox(width: 4.0),
      Text(
          DateFormat("dd \'d\'e MMMM \'d\'e yyyy", "pt_BR")
              .format(dateFromMilliseconds(calendar.date)),
          style: TextStyle(fontSize: 12.0, color: Colors.grey[400]))
    ]);
  }

  Widget _buildTableCalendar() {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: TableCalendar(
        locale: 'pt_BR',
        //events: _visibleEvents,
        //holidays: _visibleHolidays,
        onDaySelected: (time, list) {
          setState(() {
            date = time;
          });
          _calendarBloc.dispatch(CalendarFetch(time));
        },
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
