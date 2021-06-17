import 'package:fitness_app_ii_example/controller/exercise_controller.dart';

import '../model/exercise_set.dart';

import 'package:get/get.dart';

import '../dbhelper/init_db_helper.dart';
import '../model/exercise.dart';
import '../utils/string_constant.dart';

class CustomController extends GetxController {
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  ExerciseController exerciseController = Get.find();

  Data dbExercise = Data();

  final customExercises = RxList<Exercise>();
  final exerciseSets = RxList<ExerciseSet>();

  List<Exercise> exerciseByExerciseSetId(int exerciseSetId) {
    final result = customExercises.where((e) => e.exerciseSetId == exerciseSetId).toList();
    return result;
  }

  void deleteCustomExercise(int id) async {
    await dbExercise.remove(id: id, table: tableCustomExerciseText);
    dbExercise.getCustomExercises().then((e) => customExercises.assignAll(e));
    update();
  }

  void deleteExerciseSet(int id) async {
    await dbExercise.remove(id: id, table: Data.tableExerciseSet);
    dbExercise.getExerciseSets().then((e) => exerciseSets.assignAll(e));
    update();
  }

  void loadData() async {
    customExercises.assignAll(await dbExercise.getCustomExercises());
    exerciseSets.assignAll(await dbExercise.getExerciseSets());
    update();
  }

  void addCustomExercise(Exercise exercise) async {
    await dbExercise.add(parameter: exercise, table: tableCustomExerciseText);
    loadData();
  }

  void addExerciseSet(Exercise exercise) async {
    await dbExercise.add(parameter: exercise, table: tableExerciseSetText);
    loadData();
  }

  Future<int> addHistory(Exercise exercise) async {
    final result = await dbExercise.add(parameter: exercise, table: tableHistoryText);
    return result;
  }
}
