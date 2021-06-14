import 'dart:io';

import 'package:fitness_app_ii_example/model/exercise_set.dart';
import 'package:fitness_app_ii_example/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/exercise.dart';

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
    await deleteDatabase(dbPath);
    var database = openDatabase(dbPath, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
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
      createdAt TEXT);""";
  static const tableExerciseSet = """
  CREATE TABLE exerciseSet(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      exercises TEXT NOT NULL,
      exerciseType TEXT,
      totalPoint INTEGER)""";

  void _onCreate(Database db, int version) async {
    await db.execute(tableExercise);
    await db.execute(tableExerciseSet);
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {}

  Future<int> add({@required var parameter, @required String table}) async {
    var client = await db;
    return client.insert(table, parameter.toMapForDb(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Exercise> getOneExercise(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps = client.query(tableExerciseText, where: 'id = ?', whereArgs: [id]);
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

  Future getAllExerciseSet() async {
    var client = await db;
    var res = await client.query(tableExerciseSetText);

    if (res.isNotEmpty) {
      var exercises = res.map((map) => ExerciseSet.fromJson(map)).toList();
      return exercises;
    }
    return [];
  }

  Future<int> update({@required var parameter, @required String table}) async {
    var client = await db;
    return client.update(table, parameter.toMapForDb(), where: 'id = ?', whereArgs: [parameter.id], conflictAlgorithm: ConflictAlgorithm.replace);
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