import '../controller/exercise_controller.dart';
import 'package:get/instance_manager.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put(ExerciseController(), permanent: true);
    // Get.put(ExerciseSetController(), permanent: true);
  }
}
