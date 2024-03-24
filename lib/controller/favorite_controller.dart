import 'package:get/get.dart';

import '../model/exercise.dart';
import 'exercise_controller.dart';

class FavoriteController extends GetxController {
  //Init
  var favourites = Rx<List<Exercise>>([]);
  ExerciseController exerciseController = Get.find();

  @override
  void onInit() async {
    await loadData();
    super.onInit();
  }

  //Function
  loadData() {
    if (exerciseController.exercises.isNotEmpty) {
      final result = exerciseController.exercises;
      favourites.value = result.where((e) => e.isFavourite ?? false).toList();
    }
    update();
  }
}
