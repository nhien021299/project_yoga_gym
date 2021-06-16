import '../controller/favorite_controller.dart';
import '../controller/history_controller.dart';

import '../controller/exercise_controller.dart';
import 'package:get/instance_manager.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put(ExerciseController(), permanent: true);
    Get.put(HistoryController(), permanent: true);
    Get.put(FavoriteController(), permanent: true);
  }
}
