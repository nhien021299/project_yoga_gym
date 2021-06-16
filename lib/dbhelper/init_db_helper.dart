import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/exercise.dart';
import '../utils/string_constant.dart';

class Data {
  static final Data _instance = Data._();
  static Database _database;

  Data._();

  factory Data() {
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
    // await deleteDatabase(dbPath);
    var database = openDatabase(dbPath,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);

    return database;
  }

  static const tableExercise = """
  CREATE TABLE exercise(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      reps INTEGER NOT NULL,
      point INTEGER,
      imageUrl TEXT,
      videoUrl TEXT,
      type TEXT,
      isFavourite BOOLEAN,
      createdAt TEXT);""";
  static const tabHistory = """
  CREATE TABLE tableHistory(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      reps INTEGER NOT NULL,
      point INTEGER,
      imageUrl TEXT,
      videoUrl TEXT,
      type TEXT,
      isFavourite BOOLEAN,
      createdAt TEXT);""";

  void _onCreate(Database db, int version) async {
    await db.execute(tableExercise);
    await db.execute(tabHistory);
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {}

  Future<int> add({@required var parameter, @required String table}) async {
    var client = await db;
    return client.insert(table, parameter.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Exercise> getOneExercise(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
        client.query(tableExerciseText, where: 'id = ?', whereArgs: [id]);
    var maps = await futureMaps;

    if (maps.length != 0) {
      return Exercise.fromJson(maps.first);
    }

    return null;
  }

  Future<List<Exercise>> getAllExercise() async {
    var client = await db;
    var res = await client.query(tableExerciseText);

    List<Exercise> exercises = [];
    if (res.isNotEmpty) {
      exercises = res.map((map) => Exercise.fromJson(map)).toList();
    }
    return exercises;
  }

  Future<List<Exercise>> getAllExerciseHistory() async {
    var client = await db;
    var res = await client.query(tableHistoryText);

    List<Exercise> history = [];
    if (res.isNotEmpty) {
      history = res.map((map) => Exercise.fromJson(map)).toList();
    }
    return history;
  }

  Future<int> update({@required var parameter, @required String table}) async {
    var client = await db;
    return client.update(table, parameter.toJson(),
        where: 'id = ?',
        whereArgs: [parameter.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateFavorites(
      {@required var parameter, @required String table}) async {
    var client = await db;
    return client.update(table, {'isFavourite': !parameter.isFavourite},
        where: 'id = ?',
        whereArgs: [parameter.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> remove({@required int id, @required String table}) async {
    var client = await db;
    return client.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future closeDb() async {
    var client = await db;
    client.close();
  }
}
