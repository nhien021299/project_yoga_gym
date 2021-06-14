// import 'package:fitness_app_ii_example/data/exercise_sets_data.dart';
// import 'package:fitness_app_ii_example/dbhelper/init_db_helper.dart';
// import 'package:fitness_app_ii_example/model/exercise_set.dart';
// import 'package:fitness_app_ii_example/utils/string_constant.dart';
// import 'package:get/get.dart';

// class ExerciseSetController extends GetxController {
//   @override
//   void onInit() {
//     dbExerciseSet = Data();
//     initExerciseSet();
//     getAllList();
//     super.onInit();
//   }

//   Data dbExerciseSet;
//   var listExerciseSets = Rx<List<ExerciseSet>>();
//   void deleteExerciseSet(int id) async {
//     await dbExerciseSet.remove(id: id, table: tableExerciseSetText);
//     dbExerciseSet.getAllExerciseSet().then((e) => listExerciseSets.value = e);
//     update();
//   }

//   void getAllList() async {
//     var _listExerciseSets = await dbExerciseSet.getAllExerciseSet();
//     print(_listExerciseSets);

//     listExerciseSets.value = _listExerciseSets;
//     update();
//   }

//   void initExerciseSet() {
//     exerciseSets.forEach((e) {
//       dbExerciseSet.add(parameter: e, table: tableExerciseSetText);
//       print(e);
//     });
//   }

//   void addExerciseSet(ExerciseSet exerciseSet) async {
//     await dbExerciseSet.add(
//         parameter: exerciseSet, table: tableExerciseSetText);
//     getAllList();
//   }
// }
