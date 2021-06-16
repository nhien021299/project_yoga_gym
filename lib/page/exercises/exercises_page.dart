import 'package:fitness_app_ii_example/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import '../../controller/exercise_controller.dart';
import '../../data/category_data.dart';
import '../../widget/default_layout.dart';
import '../../widget/exercises_item_widget.dart';
import 'widgets/categories_item_widget.dart';

class ExercisesPage extends StatefulWidget {
  const ExercisesPage({Key key}) : super(key: key);

  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  ExerciseController _exerciseController = Get.find();

  @override
  Widget build(BuildContext context) => DefaultLayout(
        background: Image.asset(
          'assets/images/home_bg.png',
          height: Get.height,
          width: Get.width,
          fit: BoxFit.fill,
        ),
        body: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Exercise",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Categories",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            _exerciseController.selectedType = categories[index].name;
                            print(_exerciseController.filteredExercise.length);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CategoriesItemWidget(
                              name: categories[index].name,
                              imageUrl: categories[index].imageUrl,
                              isSelected: categories[index].name == _exerciseController.selectedType,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      child: Obx(
                        () => ListView.builder(
                          itemCount: _exerciseController.filteredExercise.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => _exerciseController.playVideo(
                                _exerciseController.filteredExercise[index],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: ExercisesItemWidget(
                                  image: _exerciseController.filteredExercise[index].imageUrl,
                                  title: _exerciseController.filteredExercise[index].name,
                                  value: _exerciseController.filteredExercise[index].reps,
                                  isFavorite: _exerciseController.filteredExercise[index].isFavourite,
                                  onTap: () => _exerciseController.updateFavorites(
                                    _exerciseController.filteredExercise[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
