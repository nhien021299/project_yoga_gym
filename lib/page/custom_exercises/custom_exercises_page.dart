import 'package:fitness_app_ii_example/controller/custom_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/default_layout.dart';
import '../../widget/exercise_set_item_widget.dart';

class CustomExercisesPage extends StatefulWidget {
  const CustomExercisesPage({Key key}) : super(key: key);

  @override
  _CustomExercisesPageState createState() => _CustomExercisesPageState();
}

class _CustomExercisesPageState extends State<CustomExercisesPage> {
  CustomController customController = Get.put(CustomController());

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
                  style: Theme.of(context).textTheme.headline4.copyWith(
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
                    child: Obx(
                      () => ListView.builder(
                        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                        itemCount: customController.exerciseSets.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                customController.exerciseSets[index].name.toString(),
                                style: Theme.of(context).textTheme.headline6.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: SizedBox(
                                  height: 100,
                                  child: ListView.builder(
                                    physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: customController.exerciseByExerciseSetId(customController.exerciseSets[index].id).length,
                                    itemBuilder: (BuildContext context, int i) {
                                      final filteredCustomExercise =
                                          customController.exerciseByExerciseSetId(customController.exerciseSets[index].id)[i];
                                      return GestureDetector(
                                        onTap: () => customController.exerciseController.playVideo(filteredCustomExercise),
                                        child: ExerciseSetItemWidget(imageUrl: filteredCustomExercise.imageUrl),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
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
