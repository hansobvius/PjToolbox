import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper{
  static final _databaseName = 'PjDatabase.db';
  static final  _databaseVersion = 1;

  static final _table = 'table';

  static final columnId = '_id';
  static final columnDay = 'day';
  static final columnMonth = 'month';
  static final columnYear = 'year';
  static final columnEntrada = 'entrada';
  static final columnPausa = 'pausa';
  static final columnSaida = 'saida';
  static final columnTotal = 'total';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_table (
            $columnId INTEGER PRIMARY KEY,
            $columnDay TEXT PRIMARY KEY,
            $columnMonth TEXT PRIMARY KEY,
            $columnYear TEXT PRIMARY KEY,
            $columnEntrada TEXT NOT NULL,
            $columnPausa TEXT NOT NULL
            $columnSaida TEXT NOT NULL,
            $columnTotal TEXT NOT NULL
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(_table);
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $_table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(_table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete() async {
    Database db = await instance.database;
    return await db.delete(_table);
  }
}