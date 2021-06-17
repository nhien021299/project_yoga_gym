import '../controller/exercise_controller.dart';
import '../page/custom_exercises/widgets/add_dialog.dart';
import '../page/custom_exercises/widgets/input_widget.dart';
import 'package:flutter/cupertino.dart';

import '../model/exercise_set.dart';

import 'package:get/get.dart';

import '../dbhelper/init_db_helper.dart';
import '../model/exercise.dart';
import '../utils/string_constant.dart';

class CustomController extends GetxController {
  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  ExerciseController exerciseController = Get.find();

  Data dbExercise = Data();

  final customExercises = RxList<Exercise>();
  final exerciseSets = RxList<ExerciseSet>();

  final setNameController = TextEditingController();

  List<Exercise> exerciseByExerciseSetId(int exerciseSetId) {
    final result = customExercises.where((e) => e.exerciseSetId == exerciseSetId).toList();
    return result;
  }

  void deleteCustomExercise(int id) async {
    await dbExercise.remove(id: id, table: tableCustomExerciseText);
    dbExercise.getCustomExercises().then((e) => customExercises.assignAll(e));
    update();
  }

  void deleteExerciseSet(int id) async {
    await dbExercise.remove(id: id, table: Data.tableExerciseSet);
    dbExercise.getExerciseSets().then((e) => exerciseSets.assignAll(e));
    update();
  }

  void loadData() async {
    customExercises.assignAll(await dbExercise.getCustomExercises());
    exerciseSets.assignAll(await dbExercise.getExerciseSets());
    exerciseSets.forEach((element) {
      print(element.name);
    });
    print(exerciseByExerciseSetId(3).isNotEmpty);
    update();
  }

  void addCustomExercise(Exercise exercise) async {
    await dbExercise.add(parameter: exercise, table: tableCustomExerciseText);
    loadData();
  }

  void addExerciseSet(ExerciseSet exerciseSet) async {
    await dbExercise.add(parameter: exerciseSet, table: tableExerciseSetText);
    loadData();
    setNameController.clear();
    exerciseSets.refresh();
  }

  Future<int> addHistory(Exercise exercise) async {
    final result = await dbExercise.add(parameter: exercise, table: tableHistoryText);
    return result;
  }

  void openAddDialog() {
    Get.dialog(
      DialogWidget(
        title: "Add new Exercise Set",
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: InputWidget(
            inputType: TextInputType.text,
            controller: setNameController,
            hintText: "Enter set name",
          ),
        ),
        onSubmitClicked: () {
          if (setNameController.text.isNotEmpty) {
            addExerciseSet(ExerciseSet(name: setNameController.text));
            Get.back();
          }else{
            print('Name is empty');
          }
        },
        onCancel: () => Get.back(),
      ),
      barrierDismissible: false,
    );
  }
}
