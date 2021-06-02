import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/exercise.dart';

class DbExercise {
  static final DbExercise _instance = DbExercise._();
  static Database _database;
  DbExercise._();
  factory DbExercise() {
    return _instance;
  }
  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'exercise.db');
    var database = openDatabase(dbPath,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
    CREATE TABLE car(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      model TEXT,
      power INTEGER,
      top_speed INTEGER,
      is_electro INTEGER)
  ''');
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {}
  Future<int> addCar(Exercise exercise) async {
    var client = await db;
    return client.insert('excercise', exercise.toMapForDb(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Exercise> fetchCar(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
        client.query('exercise', where: 'id = ?', whereArgs: [id]);
    var maps = await futureMaps;
    if (maps.length != 0) {
      return Exercise.fromJson(maps.first);
    }
    return null;
  }

  Future<int> updateCar(Exercise newExercise) async {
    var client = await db;
    return client.update('exercise', newExercise.toMapForDb(),
        where: 'id = ?',
        whereArgs: [newExercise.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeCar(int id) async {
    var client = await db;
    return client.delete('exercise', where: 'id = ?', whereArgs: [id]);
  }
}
