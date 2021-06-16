import 'package:get/instance_manager.dart';

import '../controller/exercise_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put(ExerciseController(), permanent: true);
  }
}
