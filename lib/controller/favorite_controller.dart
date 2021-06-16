import 'package:fitness_app_ii_example/model/exercise.dart';
import 'package:get/get.dart';

import 'exercise_controller.dart';

class FavoriteController extends GetxController {
  //Init
  var listFavorites = Rx<List<Exercise>>([]);
  ExerciseController exerciseController = Get.find();
  @override
  void onInit() async {
    await getListFavorites();
    super.onInit();
  }

  //Function
  getListFavorites() {
    print(exerciseController.exercises.length);
    if (exerciseController.exercises.isNotEmpty) {
      var listExercise = exerciseController.exercises;
      listFavorites.value = listExercise.where((e) => e.isFavourite).toList();

      print(listFavorites.value);
    }
    update();
  }
}
