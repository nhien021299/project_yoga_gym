import 'package:fitness_app_ii_example/data/exercise.dart';
import 'package:fitness_app_ii_example/dbhelper/init_db_helper.dart';
import 'package:fitness_app_ii_example/model/exercise.dart';
import 'package:fitness_app_ii_example/utils/string_constant.dart';
import 'package:get/get.dart';

class ExerciseController extends GetxController {
  @override
  void onInit() {
    dbExercise = Data();
    initExercise();
    getAllList();
    super.onInit();
  }

  Data dbExercise;
  var listExercises = Rx<List<Exercise>>();
  void deleteExercise(int id) async {
    await dbExercise.remove(id: id, table: tableExerciseText);
    dbExercise.getAllExercise().then((e) => listExercises.value = e);
    update();
  }

  void getAllList() async {
    var _listExercises = await dbExercise.getAllExercise();
    print(_listExercises);

    listExercises.value = _listExercises;
    update();
  }

  void initExercise() {
    exercises1.forEach((e) {
      dbExercise.add(parameter: e, table: tableExerciseText);
      print(e);
    });
    exercises2.forEach((e) {
      dbExercise.add(parameter: e, table: tableExerciseText);
      print(e);
    });
    exercises3.forEach((e) {
      dbExercise.add(parameter: e, table: tableExerciseText);
      print(e);
    });
    exercises4.forEach((e) {
      dbExercise.add(parameter: e, table: tableExerciseText);
      print(e);
    });
  }

  void addExercise(Exercise exercise) async {
    await dbExercise.add(parameter: exercise, table: tableExerciseText);
    getAllList();
  }
}
