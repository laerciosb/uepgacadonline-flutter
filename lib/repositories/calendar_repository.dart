import 'package:sqflite/sqflite.dart';
import 'package:uepgacadonline_flutter/database/database_provider.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';

class CalendarRepository {
  Future<void> create(Calendar calendar) async {
    final database = await DBProvider.db.database;
    await database.insert(Calendar.table, calendar.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Calendar> find(int id) async {
    final database = await DBProvider.db.database;
    final result =
        await database.query(Calendar.table, where: "id = ?", whereArgs: [id]);

    return Calendar.fromJson(result.first);
  }

  Future<void> delete(int id) async {
    final database = await DBProvider.db.database;
    await database.delete(Calendar.table, where: "id = ?", whereArgs: [id]);
  }

  Future<List<Calendar>> findByDate(DateTime date) async {
    final database = await DBProvider.db.database;
    final result = await database
        .query(Calendar.table, where: "date >= ? and date < ?", whereArgs: [
      DateTime(date.year, date.month, date.day).millisecondsSinceEpoch,
      DateTime(date.year, date.month, date.day + 1).millisecondsSinceEpoch
    ]);

    List<Calendar> calendar = result.isNotEmpty
        ? result.map((c) => Calendar.fromJson(c)).toList()
        : [];

    return calendar;
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
