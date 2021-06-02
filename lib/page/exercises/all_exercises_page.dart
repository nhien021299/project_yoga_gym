import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/exercise_set.dart';
import '../../widget/default_layout.dart';
import '../../widget/exercises_item_widget.dart';
import 'widgets/categories_item_widget.dart';

class AllExercisePage extends StatefulWidget {
  const AllExercisePage({Key key}) : super(key: key);

  @override
  _AllExercisePageState createState() => _AllExercisePageState();
}

class _AllExercisePageState extends State<AllExercisePage> {
  ExerciseType selectedType = ExerciseType.low;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CategoriesItemWidget(
                      name: "Yoga",
                      imageUrl: "assets/images/yoga.png",
                    ),
                    CategoriesItemWidget(
                      name: "Work \nOut",
                      imageUrl: "assets/images/workout1.png",
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      child: ListView(
                        children: [
                          // buildWorkouts(),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/workout1.png",
                                title: "Work Out",
                                value: "15 times"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/workout2.png",
                                title: "Work Out",
                                value: "15 times"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/workout3.png",
                                title: "Work Out",
                                value: "15 times"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/crunch.png",
                                title: "Work Out",
                                value: "15 times"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/pushup.png",
                                title: "Work Out",
                                value: "15 times"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  // Widget buildWorkouts() => Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 16),
  //   child: Column(
  //         children: exerciseSets
  //             .where((element) => element.exerciseType == selectedType)
  //             .map(
  //               (exerciseSet) => Container(margin: const EdgeInsets.symmetric(vertical: 10), child: ExerciseSetWidget(exerciseSet: exerciseSet)),
  //             )
  //             .toList(),
  //       ),
  // );
}
