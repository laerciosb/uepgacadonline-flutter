import 'package:uepgacadonline_flutter/database/database_provider.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';

class CalendarRepository {
  dynamic create(Calendar calendar) async {
    final database = await DBProvider.db.database;
    final result = await database.insert(Calendar.table, calendar.toJson());

    return result;
  }

  dynamic find(int id) async {
    final database = await DBProvider.db.database;
    final result =
        await database.query(Calendar.table, where: "id = ?", whereArgs: [id]);

    return result;
  }

  dynamic findByDate(DateTime date) async {
    final database = await DBProvider.db.database;
    final result = await database
        .query(Calendar.table, where: "date = ?", whereArgs: [date]);

    return result;
  }

  dynamic all() async {
    final database = await DBProvider.db.database;
    var result = await database.query(Calendar.table);

    List<Calendar> calendar = result.isNotEmpty
        ? result.map((c) => Calendar.fromJson(c)).toList()
        : [];

    return calendar;
  }

  dynamic update(Calendar calendar) async {
    final database = await DBProvider.db.database;
    var result = await database.update(Calendar.table, calendar.toJson(),
        where: "id = ?", whereArgs: [calendar.id]);

    return result;
  }
}
