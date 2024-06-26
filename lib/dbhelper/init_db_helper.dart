import 'dart:io';

import 'package:fitness_app_ii_example/data/custom_exercise_data.dart';
import 'package:fitness_app_ii_example/model/exercise_set.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/exercise_data.dart';
import '../model/exercise.dart';
import '../utils/string_constant.dart';

class Data {
  static final Data _instance = Data._();

  Data._();

  factory Data() {
    return _instance;
  }

  Future<Database> get db async {
    final _database = await init();

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
      exerciseSetId INTEGER,
      name TEXT NOT NULL,
      reps INTEGER NOT NULL,
      point INTEGER,
      kcal INTEGER,
      imageUrl TEXT,
      videoUrl TEXT,
      type TEXT,
      isFavourite BOOLEAN,
      createdAt TEXT);""";
  static const tabHistory = """
  CREATE TABLE tableHistory(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      exerciseSetId INTEGER,
      name TEXT NOT NULL,
      reps INTEGER NOT NULL,
      point INTEGER,
      kcal INTEGER,
      imageUrl TEXT,
      videoUrl TEXT,
      type TEXT,
      isFavourite BOOLEAN,
      createdAt TEXT);""";
  static const tableCustomExercise = """
  CREATE TABLE tableCustomExercise(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      exerciseSetId INTEGER NOT NULL,
      name TEXT NOT NULL,
      reps INTEGER NOT NULL,
      point INTEGER,
      kcal INTEGER,
      imageUrl TEXT,
      videoUrl TEXT,
      type TEXT,
      isFavourite BOOLEAN,
      createdAt TEXT);""";
  static const tableExerciseSet = """
  CREATE TABLE tableExerciseSet(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL);""";

  void _onCreate(Database db, int version) async {
    await db.execute(tableExercise);
    await db.execute(tabHistory);
    await db.execute(tableCustomExercise);
    await db.execute(tableExerciseSet);
    print("Database was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {}

  Future<int> add({required var parameter, required String table}) async {
    var client = await db;
    return client.insert(table, parameter.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Exercise?>? getOneExercise(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
        client.query(tableExerciseText, where: 'id = ?', whereArgs: [id]);
    var maps = await futureMaps;

    if (maps.length != 0) {
      return Exercise.fromJson(maps.first);
    }

    return null;
  }

  Future<List<Exercise>> getExercises() async {
    var client = await db;

    var res = await client.query(tableExerciseText);

    List<Exercise> exercises = [];

    if (res.isNotEmpty) {
      for (var e in res) {
        remove(id: int.parse(e['id'].toString()), table: tableExerciseText);
      }
    }

    defaultExercise.forEach(
      (e) => add(parameter: e, table: tableExerciseText),
    );
    exercises.assignAll(defaultExercise);
    return exercises;
  }

  Future<List<Exercise>> getCustomExercises() async {
    var client = await db;

    var res = await client.query(tableCustomExerciseText);

    List<Exercise> customExercises = [];
    if (res.isNotEmpty) {
      for (var e in res) {
        remove(
            id: int.parse(e['id'].toString()), table: tableCustomExerciseText);
      }
    }

    defaultCustomExercise.forEach(
      (e) => add(parameter: e, table: tableCustomExerciseText),
    );

    customExercises.assignAll(defaultCustomExercise);
    return customExercises;
  }

  Future<List<ExerciseSet>> getExerciseSets() async {
    var client = await db;
    var res = await client.query(tableExerciseSetText);

    List<ExerciseSet> exerciseSets = [];
    if (res.isNotEmpty) {
      exerciseSets = res.map((map) => ExerciseSet.fromJson(map)).toList();
    }
    return exerciseSets;
  }

  Future<List<Exercise>> getExerciseHistories() async {
    var client = await db;
    var res = await client.query(tableHistoryText);

    List<Exercise> histories = [];
    if (res.isNotEmpty) {
      histories = res.map((map) => Exercise.fromJson(map)).toList();
    }
    return histories;
  }

  Future<int> update({required var parameter, required String table}) async {
    var client = await db;
    return client.update(table, parameter.toJson(),
        where: 'id = ?',
        whereArgs: [parameter.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateFavorites(
      {required var parameter, required String table}) async {
    var client = await db;
    return client.update(table, {'isFavourite': !parameter.isFavourite},
        where: 'id = ?',
        whereArgs: [parameter.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> remove({required int id, required String table}) async {
    var client = await db;
    return client.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  Future closeDb() async {
    var client = await db;
    client.close();
  }
}
