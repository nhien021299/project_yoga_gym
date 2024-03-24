import '../data/custom_exercise_data.dart';

import '../page/exercise_video/exercise_video_page.dart';
import 'package:sqflite/sqflite.dart';

import 'package:get/get.dart';

import '../data/exercise_data.dart';
import '../dbhelper/init_db_helper.dart';
import '../model/exercise.dart';
import '../utils/string_constant.dart';

class ExerciseController extends GetxController {
  @override
  void onInit() {
    checkTableEmpty();
    getAllList();
    super.onInit();
  }

  Data dbExercise = Data();

  final _exercises = RxList<Exercise>();
  final _selectedType = Rx<String>("Yoga");

  List<Exercise> get exercises => _exercises.toList();

  String get selectedType => _selectedType.value;

  set selectedType(String type) => _selectedType.value = type;

  List<Exercise> get filteredExercise => _exercises.where((element) => element.type == _selectedType.value).toList();

  void deleteExercise(int id) async {
    await dbExercise.remove(id: id, table: tableExerciseText);
    dbExercise.getExercises().then((e) => _exercises.assignAll(e));
    update();
  }

  void getAllList() async {
    _exercises.assignAll(await dbExercise.getExercises());
    update();
  }

  void addExercise(Exercise exercise) async {
    await dbExercise.add(parameter: exercise, table: tableExerciseText);
    getAllList();
  }

  Future<int> addHistory(Exercise exercise) async {
    final result = await dbExercise.add(parameter: exercise, table: tableHistoryText);
    return result;
  }

  void updateFavorites(Exercise exercise) async {
    await dbExercise.updateFavorites(parameter: exercise, table: tableExerciseText).then((value) => print(value));
    getAllList();
  }

  void playVideo(Exercise exercise) async {
    final newExercise = Exercise(
      id: exercise.id,
      name: exercise.name,
      imageUrl: exercise.imageUrl,
      videoUrl: exercise.videoUrl,
      point: exercise.point,
      reps: exercise.reps,
      type: exercise.type,
      kcal: exercise.kcal,
      isFavourite: exercise.isFavourite,
      createdAt: DateTime.now(),
    );
    await dbExercise.add(parameter: newExercise, table: tableHistoryText);
    Get.to(
      ExerciseVideoPage(
        exercise: exercise,
      ),
    );
  }

  void checkTableEmpty() async {
    var db = await dbExercise.db;

    int? count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM exercise'));
    int? exerciseSetCount = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM tableExerciseSet'));
    int? customExerciseCount = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM tableCustomExercise'));

    if (count == 0 && exerciseSetCount == 0 && customExerciseCount == 0) {
      defaultExercise.forEach(
        (e) => dbExercise.add(parameter: e, table: tableExerciseText),
      );
      defaultCustomExercise.forEach(
        (e) => dbExercise.add(parameter: e, table: tableCustomExerciseText),
      );
    }
  }
}
