import 'package:intl/intl.dart';

final _dateFormatter = DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz');

DateTime dateFromJson(String date) => _dateFormatter.parse(date);
String dateToJson(DateTime date) => _dateFormatter.format(date);

DateTime dateFromMilliseconds(int milliseconds) =>
    DateTime.fromMillisecondsSinceEpoch(milliseconds);
int dateToMilliseconds(DateTime dateTime) => dateTime.millisecondsSinceEpoch;
