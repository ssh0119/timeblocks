import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

mixin Persistable {
  _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE Test (id INTEGER PRIMARY KEY, value TEXT)");
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
        CREATE TABLE IF NOT EXISTS timeblocks (
          name TEXT NOT NULL,
          intervals TEXT
        );
      ''');
  }

  Database get database async {
    var databasesPath = await sql.getDatabasesPath();
    var dbPath = path.join(databasesPath, 'timeblocks_app.db');
    var db = await sql.openDatabase(dbPath,
        onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  Future<int> insertRecord(
      String tableName, Map<String, Object?> recordMap) async {
    return await database.insert(tableName, recordMap);
  }
}
