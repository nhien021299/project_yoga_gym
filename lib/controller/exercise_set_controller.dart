import 'package:fitness_app_ii_example/dbhelper/init_db_helper.dart';
import 'package:fitness_app_ii_example/model/exercise_set.dart';
import 'package:fitness_app_ii_example/utils/string_constant.dart';
import 'package:get/get.dart';

class ExerciseSetController extends GetxController {
  @override
  void onInit() {
    dbExerciseSet = Data();
    getAllList();
    super.onInit();
  }

  Data dbExerciseSet;
  var exerciseSets = Rx<List<ExerciseSet>>();

  void deleteExerciseSet(int id) async {
    await dbExerciseSet.remove(id: id, table: tableExerciseSetText);
    dbExerciseSet.getExerciseSets().then((e) => exerciseSets.value = e);
    update();
  }

  void getAllList() async {
    exerciseSets.value.assignAll(await dbExerciseSet.getExerciseSets());
    update();
  }

  void addExerciseSet(ExerciseSet exerciseSet) async {
    await dbExerciseSet.add(parameter: exerciseSet, table: tableExerciseSetText);
    getAllList();
  }
}
