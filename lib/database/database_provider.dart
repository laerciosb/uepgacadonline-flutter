import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database _database;

  Future<Database> get database async {
    if (_database != null)
      return _database;


    _database = await initDatabase();
    return _database;
  }


  initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "uepgacadonline.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE calendar ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "title TEXT,"
          "date DATE,"
          "complete BIT"
          ")");
    });
  }
}

