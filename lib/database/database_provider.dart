import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uepgacadonline_flutter/models/calendar.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), "uepgacadonline.db"),
        onCreate: (Database db, int version) async {
      await db.execute(Calendar.createTable);
    }, version: 2);
  }
}
