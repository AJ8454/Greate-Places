import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {
  // this will create db..
  static Future<Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, verison) {
        // This will create the table if not exist with 3 attributes..
        return db.execute(
            'CREATE TABLE user_places(id TEXT PRIMARY KEY, title  TEXT, image TEXT)');
      },
      version: 1,
    );
  }

  // this method is for  insert data..
  static Future<void> insert(String? table, Map<String, Object> data) async {
    final db = await DBHelper.database();
    db.insert(
      table!,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
      // conflictAlgo is used because if redudancy heppen then it will override with new data..
    );
  }

  // this method is to fetch data fro db..
  static Future<List<Map<String, dynamic>>> getData(String? table) async {
    final db = await DBHelper.database();
    return db.query(
      table!,
    );
  }
}
