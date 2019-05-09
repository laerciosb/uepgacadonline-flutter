import 'package:sqflite/sqflite.dart';
import 'package:uepgacadonline_flutter/database/database_provider.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';

class CalendarRepository {
  Future<void> create(Calendar calendar) async {
    final database = await DBProvider.db.database;
    await database.insert(Calendar.table, calendar.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Calendar> find(int id) async {
    final database = await DBProvider.db.database;
    final result =
        await database.query(Calendar.table, where: "id = ?", whereArgs: [id]);

    return Calendar.fromJson(result.first);
  }

  dynamic findByDate(DateTime date) async {
    final database = await DBProvider.db.database;
    final result = await database
        .query(Calendar.table, where: "date = ?", whereArgs: [date]);

    return result;
  }

  Future<List<Calendar>> all() async {
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

final calendarRepository = CalendarRepository();