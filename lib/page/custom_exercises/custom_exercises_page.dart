import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/default_layout.dart';
import '../../widget/exercise_set_item_widget.dart';

class CustomExercisesPage extends StatelessWidget {
  const CustomExercisesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      background: Image.asset(
        'assets/images/home_bg.png',
        height: Get.height,
        width: Get.width,
        fit: BoxFit.fill,
      ),
      body: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Customized",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 12),
                Text(
                  "Create your's own style !",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Divider(height: 50),
                Expanded(
                  child: SizedBox(
                    child: ListView(
                      children: [
                        // buildWorkouts(),
                        // Exercise Set
                        Text(
                          "Customized set 1",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ExerciseSetItemWidget(
                                    imageUrl: "assets/images/workout1.png"),
                                ExerciseSetItemWidget(
                                    imageUrl: "assets/images/workout2.png"),
                                ExerciseSetItemWidget(
                                    imageUrl: "assets/images/workout3.png"),
                                ExerciseSetItemWidget(
                                  imageUrl: "assets/images/pushup.png",
                                ),
                                ExerciseSetItemWidget(
                                  imageUrl: "assets/images/crunch.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(height: 32),
                        Text(
                          "Customized set 2",
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                ExerciseSetItemWidget(
                                    imageUrl: "assets/images/workout1.png"),
                                ExerciseSetItemWidget(
                                    imageUrl: "assets/images/workout2.png"),
                                ExerciseSetItemWidget(
                                    imageUrl: "assets/images/workout3.png"),
                                ExerciseSetItemWidget(
                                  imageUrl: "assets/images/pushup.png",
                                ),
                                ExerciseSetItemWidget(
                                  imageUrl: "assets/images/crunch.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
