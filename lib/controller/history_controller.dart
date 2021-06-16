import 'package:fitness_app_ii_example/controller/exercise_controller.dart';
import 'package:fitness_app_ii_example/model/exercise.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final ExerciseController exerciseController = Get.find();
  var listHistory = Rx<List<Exercise>>([]);
  var totalPoint = 0.obs;
  List<Exercise> getfilteredExercise(DateTime dateTime) => listHistory.value
      .where((element) => element.createdAt == dateTime)
      .toList();

  @override
  void onInit() {
    getAllHistory();
    super.onInit();
  }

  void getAllHistory() async {
    await exerciseController.dbExercise
        .getAllExerciseHistory()
        .then((value) => listHistory.value = value);
    print(listHistory);
    update();
  }

  int getTotalPoint(List<Exercise> listHistory) {
    if (listHistory.isNotEmpty) {
      listHistory.forEach((e) {
        totalPoint.value += e.point;
      });
    }
    if (totalPoint.value > 2000) totalPoint.value = 2000;
    return totalPoint.value;
  }

  void filterDate() {}
}
