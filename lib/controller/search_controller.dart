import 'package:flutter/cupertino.dart';

import '../data/custom_exercise_data.dart';

import '../page/exercise_video/exercise_video_page.dart';
import 'package:sqflite/sqflite.dart';

import 'package:get/get.dart';

import '../data/exercise_data.dart';
import '../dbhelper/init_db_helper.dart';
import '../model/exercise.dart';
import '../utils/string_constant.dart';

class SearchExerciseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>SearchExerciseController());
  }
}

class SearchExerciseController extends GetxController {

  /// Khi khởi tạo Controller => Hàm init chạy dau tien.
  @override
  void onInit() {
    checkTableEmpty();

    /// Hàm lấy toàn bộ danh sách bài tập.
    getAllList();
    super.onInit();
  }

  Data dbExercise = Data();

  /// TextField sẽ có "TextEditingController".
  final TextEditingController textController = TextEditingController();


  /// LOGIC search bao gốm.
  /// - 1 list gốc chứa toàn bộ DATA.
  final RxList<Exercise> exercises = RxList<Exercise>();

  /// - 1 list để hiển thị các kết quả search đc từ TextInput.
  final RxList<Exercise> searchExercises = RxList<Exercise>([]);

  void deleteExercise(int id) async {
    await dbExercise.remove(id: id, table: tableExerciseText);
    dbExercise.getExercises().then((e) => exercises.assignAll(e));
    update();
  }

  void getAllList() async {

    /// Gét data từ DB gắn vào exercises = hàm .assignAll()
    exercises.assignAll(await dbExercise.getExercises());

    /// Tương tự với list search.
    searchExercises.assignAll(List.from(exercises));

    update();
  }

  void handleSearch(String? search) {

    if( (search ?? '').isEmpty ) {
      searchExercises.assignAll(List.from(exercises));

    } else {
      /// Dùng "search" là ký tự nhập từ bán phím, Tìm trong list "exercises".
      /// contains nghĩ là có tồn tại hay ko. Xem "search" có nằm trong tên bài tập hay ko.
      /// => tempList => Sẽ lấy ra được các bài tập có tồn tại "search".
      /// VD nhập chữ "a" => lấy ra được các bài tập có tên chứa chữ "a".
      final tempList = exercises.where((e) => e.name!.toLowerCase().contains(search!));

      searchExercises(List.from(tempList));

      /// ua thhay may cai clip youtu thay de nguon o dau
    }
  }

  void addExercise(Exercise exercise) async {
    await dbExercise.add(parameter: exercise, table: tableExerciseText);
    getAllList();
  }

  Future<int> addHistory(Exercise exercise) async {
    final result = await dbExercise.add(parameter: exercise, table: tableHistoryText);
    return result;
  }

  void updateFavorites(Exercise exercise) async {
    await dbExercise.updateFavorites(parameter: exercise, table: tableExerciseText).then((value) => print(value));
    getAllList();
  }

  void playVideo(Exercise exercise) async {
    final newExercise = Exercise(
      id: exercise.id,
      name: exercise.name,
      imageUrl: exercise.imageUrl,
      videoUrl: exercise.videoUrl,
      point: exercise.point,
      reps: exercise.reps,
      type: exercise.type,
      kcal: exercise.kcal,
      isFavourite: exercise.isFavourite,
      createdAt: DateTime.now(),
    );
    await dbExercise.add(parameter: newExercise, table: tableHistoryText);
    Get.to(
      ExerciseVideoPage(
        exercise: exercise,
      ),
    );
  }

  void checkTableEmpty() async {
    var db = await dbExercise.db;

    int? count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM exercise'));
    int? exerciseSetCount = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM tableExerciseSet'));
    int? customExerciseCount = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM tableCustomExercise'));

    if (count == 0 && exerciseSetCount == 0 && customExerciseCount == 0) {
      defaultExercise.forEach(
            (e) => dbExercise.add(parameter: e, table: tableExerciseText),
      );
      defaultCustomExercise.forEach(
            (e) => dbExercise.add(parameter: e, table: tableCustomExerciseText),
      );
    }
  }
}
