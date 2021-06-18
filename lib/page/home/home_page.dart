import 'package:fitness_app_ii_example/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/default_layout.dart';
import '../../widget/exercise_set_item_widget.dart';
import 'widgets/activity_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    setState(() {
      homeController.loadData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      background: Image.asset(
        'assets/images/home_bg.png',
        height: Get.height,
        width: Get.width,
        fit: BoxFit.fill,
      ),
      body: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "How are you doing?",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Daily Activities",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Obx(
                    () => ActivityCard(
                      value: homeController?.totalExercises?.value ?? 0,
                      unit: "Exercises",
                      chartImage: 'assets/icons/line_chart.png',
                      unitIcon: 'assets/icons/exercise.png',
                    ),
                  ),
                  SizedBox(height: 12),
                  Obx(
                    () => ActivityCard(
                      value: homeController?.totalKcal?.value ?? 0,
                      unit: "Calories",
                      chartImage: 'assets/icons/line_chart.png',
                      unitIcon: 'assets/icons/fire.png',
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Recommend :",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Workout basic",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          physics:
                              ScrollPhysics(parent: BouncingScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController
                              .exerciseByExerciseSetId(100)
                              .length,
                          itemBuilder: (BuildContext context, int i) {
                            final filteredCustomExercise =
                                homeController.exerciseByExerciseSetId(100)[i];
                            return GestureDetector(
                              onTap: () {
                                homeController.exerciseController
                                    .playVideo(filteredCustomExercise);
                                setState(() {
                                  homeController.loadData();
                                });
                              },
                              child: ExerciseSetItemWidget(
                                  imageUrl: filteredCustomExercise.imageUrl),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Yoga basic",
                    style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: SizedBox(
                        height: 100,
                        child: ListView.builder(
                          physics:
                              ScrollPhysics(parent: BouncingScrollPhysics()),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController
                              .exerciseByExerciseSetId(200)
                              .length,
                          itemBuilder: (BuildContext context, int i) {
                            final filteredCustomExercise =
                                homeController.exerciseByExerciseSetId(200)[i];
                            return GestureDetector(
                              onTap: () => homeController.exerciseController
                                  .playVideo(filteredCustomExercise),
                              child: ExerciseSetItemWidget(
                                  imageUrl: filteredCustomExercise.imageUrl),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16 * 1.5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "GOOD",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                "Performance",
                                style: TextStyle(height: 1),
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Container(
                          height: 65,
                          width: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star_rounded,
                                  color: Theme.of(context).primaryColor),
                              Icon(Icons.star_rounded,
                                  color: Theme.of(context).primaryColor),
                              Icon(Icons.star_rounded,
                                  color: Theme.of(context).primaryColor),
                              Icon(Icons.star_rounded,
                                  color: Theme.of(context).primaryColor),
                              Icon(Icons.star_half_rounded,
                                  color: Theme.of(context).primaryColor),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
