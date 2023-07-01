import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

mixin Persistable {
  _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE IF NOT EXISTS timeblocks (
          id INTEGER PRIMARY KEY,
          name TEXT NOT NULL,
          intervals TEXT,
          created_at TEXT NOT NULL,
          updated_at TEXT NOT NULL
        );
      ''');
  }

  Future<Database> get database async {
    var databasesPath = await sql.getDatabasesPath();
    var dbPath = path.join(databasesPath, 'timeblocks_app.db');
    var db = await sql.openDatabase(dbPath,
        onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  Future<int> insertRecord(
      String tableName, Map<String, Object?> recordMap) async {
    final nowIso8601 = DateTime.now().toIso8601String();

    var recordWithDates = {
      ...recordMap,
      'created_at': nowIso8601,
      'updated_at': nowIso8601
    };

    var db = await database;
    return await db.insert(tableName, recordWithDates);
  }
}
