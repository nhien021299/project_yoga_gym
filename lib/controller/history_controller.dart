import 'package:get/get.dart';

import '../model/exercise.dart';
import 'exercise_controller.dart';

class HistoryController extends GetxController {
  final ExerciseController exerciseController = Get.find();
  final histories = Rx<List<Exercise>>([]);
  final totalPoint = Rx<int>();
  final now = DateTime.now();
  final selectedDay = Rx<DateTime>(DateTime.now());

  List<DateTime> listDateTime;

  List<Exercise> get filteredHistories => histories.value
      .where((element) => equalsDate(element.createdAt, selectedDay.value))
      .toList();

  @override
  void onInit() {
    // loadData();
    super.onInit();
  }

  void loadData() async {
    listDateTime = List<DateTime>.generate(
        7, (index) => now.subtract(Duration(days: index)));
    await exerciseController.dbExercise
        .getAllExerciseHistory()
        .then((value) => histories.value = value);
    print(filteredHistories.length);
    getTotalPoint();
    update();
  }

  void onSelectedDay(DateTime dateTime) {
    selectedDay.value = dateTime;
  }

  bool equalsDate(DateTime a, DateTime b) {
    return a.day == b.day && a.month == b.month && a.year == b.year;
  }

  void getTotalPoint() {
    totalPoint.value = 0;
    filteredHistories.forEach((e) {
      if (DateTime.now().difference(e.createdAt).inDays < 7) {
        totalPoint.value += e.point;
      }
    });
    if (totalPoint.value > 2000) totalPoint.value = 2000;
    update();
  }
}
