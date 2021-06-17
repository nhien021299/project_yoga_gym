import 'package:get/get.dart';

import '../model/exercise.dart';
import 'exercise_controller.dart';

class HomeController extends GetxController {
  final ExerciseController exerciseController = Get.find();
  final histories = Rx<List<Exercise>>([]);
  final customExercises = RxList<Exercise>();

  final totalKcal = Rx<int>();
  final totalExercises = Rx<int>();

  List<Exercise> get dailyActivities => histories.value.where((element) => equalsDate(element.createdAt, DateTime.now())).toList();

  List<Exercise> exerciseByExerciseSetId(int exerciseSetId) {
    final result = customExercises.where((e) => e.exerciseSetId == exerciseSetId).toList();
    return result;
  }

  @override
  void onInit() {
    super.onInit();
  }

  void loadData() async {
    histories.value.assignAll(await exerciseController.dbExercise.getExerciseHistories());
    customExercises.assignAll(await exerciseController.dbExercise.getCustomExercises());
    getTotalValue();
    update();
  }

  bool equalsDate(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }

  void getTotalValue() {
    totalKcal.value = 0;
    totalExercises.value = dailyActivities.length;
    dailyActivities.forEach(
      (e) => totalKcal.value += e.kcal,
    );
    update();
  }
}
