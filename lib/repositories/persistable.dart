import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

mixin Persistable {
  _onCreate(Database db, int version) async {
    await db.execute('''
        CREATE TABLE IF NOT EXISTS timeblocks (
          id TEXT PRIMARY KEY,
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

    print(dbPath);
    var db = await sql.openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
    );

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

  Future<List<Map>> deleteRecord(String tableName, String recordId) async {
    var db = await database;

    return db.rawQuery('DELETE FROM $tableName WHERE id = "$recordId";');
  }

  Future<List<Map>> fetchAll(String tableName) async {
    var db = await database;
    return db.rawQuery('SELECT * FROM $tableName;');
  }
}
