import 'package:fitness_app_ii_example/data/exercise_data.dart';
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

  final _exercises = RxList<Exercise>();
  final _selectedType = Rx<String>("Yoga");

  List<Exercise> get exercises => _exercises.toList();

  String get selectedType => _selectedType.value;

  set selectedType(String type) => _selectedType.value = type;

  List<Exercise> get filteredExercise => _exercises.where((element) => element.type == _selectedType.value).toList();

  void deleteExercise(int id) async {
    await dbExercise.remove(id: id, table: tableExerciseText);
    dbExercise.getAllExercise().then((e) => _exercises.assignAll(e));
    update();
  }

  void getAllList() async {
    _exercises.assignAll(await dbExercise.getAllExercise());
    update();
  }

  void initExercise() {
    defaultExercise.forEach((e) {
      dbExercise.add(parameter: e, table: tableExerciseText);
      print(e);
    });
  }

  void addExercise(Exercise exercise) async {
    await dbExercise.add(parameter: exercise, table: tableExerciseText);
    getAllList();
  }
}
