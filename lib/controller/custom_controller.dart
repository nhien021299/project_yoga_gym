import 'package:fitness_app_ii_example/widget/exercises_item_widget.dart';

import '../controller/exercise_controller.dart';
import '../page/custom_exercises/widgets/dialog.dart';
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

  final selectedExercise = Rx<Exercise>();

  int exerciseSetId;

  List<Exercise> exerciseByExerciseSetId(int exerciseSetId) {
    final result = customExercises.where((e) => e.exerciseSetId == exerciseSetId).toList();
    return result;
  }

  void deleteCustomExercise(int id) async {
    await dbExercise.remove(id: id, table: tableCustomExerciseText);
    dbExercise.getCustomExercises().then((e) => customExercises.assignAll(e));
    update();
    loadData();
  }

  void deleteExerciseSet(int id) async {
    await dbExercise.remove(id: id, table: tableExerciseSetText);
    dbExercise.getExerciseSets().then((e) => exerciseSets.assignAll(e));
    update();
    loadData();
  }

  void loadData() async {
    customExercises.assignAll(await dbExercise.getCustomExercises());
    exerciseSets.assignAll(await dbExercise.getExerciseSets());
    update();
  }

  void addCustomExercise(Exercise exercise) async {
    await dbExercise.add(parameter: exercise, table: tableCustomExerciseText);
    loadData();
    selectedExercise.value = null;
  }

  void addExerciseSet(ExerciseSet exerciseSet) async {
    await dbExercise.add(parameter: exerciseSet, table: tableExerciseSetText);
    loadData();
    setNameController.clear();
  }

  void updateExerciseSet(ExerciseSet exerciseSet) async {
    await dbExercise.update(parameter: exerciseSet, table: tableExerciseSetText);
    loadData();
    setNameController.clear();
  }

  Future<int> addHistory(Exercise exercise) async {
    final result = await dbExercise.add(parameter: exercise, table: tableHistoryText);
    return result;
  }

  void onRenameExerciseSet({@required String title, @required String hintText, @required Function onClick}) {
    Get.dialog(
      DialogWidget(
        title: title,
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: InputWidget(
            inputType: TextInputType.text,
            controller: setNameController,
            hintText: hintText,
          ),
        ),
        onSubmitClicked: onClick,
        onCancel: () {
          setNameController.clear();
          Get.back();
        },
      ),
      barrierDismissible: false,
    );
  }

  void oneChooseExercise() {
    Get.dialog(
      DialogWidget(
        title: "Choose Exercise",
        widget: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: exerciseController.exercises.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () => selectedExercise.value = exerciseController.exercises[index],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      child: ExercisesItemWidget(
                        image: exerciseController.exercises[index].imageUrl,
                        title: exerciseController.exercises[index].name,
                        value: exerciseController.exercises[index].reps,
                        isFavorite: exerciseController.exercises[index].isFavourite,
                        showFavourite: true,
                        onTap: () => exerciseController.updateFavorites(
                          exerciseController.exercises[index],
                        ),
                        isSelected: selectedExercise.value == exerciseController.exercises[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        onSubmitClicked: () {
          final newExercise = Exercise(
            id: selectedExercise.value.id,
            exerciseSetId: exerciseSetId,
            name: selectedExercise.value.name,
            imageUrl: selectedExercise.value.imageUrl,
            videoUrl: selectedExercise.value.videoUrl,
            point: selectedExercise.value.point,
            reps: selectedExercise.value.reps,
            type: selectedExercise.value.type,
            kcal: selectedExercise.value.kcal,
            isFavourite: selectedExercise.value.isFavourite,
            createdAt: DateTime.now(),
          );
          addCustomExercise(newExercise);
          Get.back();
        },
        onCancel: () {
          selectedExercise.value = null;
          Get.back();
        },
      ),
    );
  }

  void onDeleteExerciseSet(int exerciseSetId) => Get.dialog(
        DialogWidget(
          title: "Are you sure ?",
          widget: SizedBox(height: 30),
          onSubmitClicked: () {
            deleteExerciseSet(exerciseSetId);
            Get.back();
          },
          onCancel: () {
            Get.back();
          },
        ),
      );

  void onDeleteExercise(int exerciseId) => Get.dialog(
        DialogWidget(
          title: "Are you sure ?",
          widget: SizedBox(height: 30),
          onSubmitClicked: () {
            deleteCustomExercise(exerciseId);
            Get.back();
          },
          onCancel: () {
            Get.back();
          },
        ),
      );
}
