import 'package:fitness_app_ii_example/controller/custom_controller.dart';
import 'package:fitness_app_ii_example/model/exercise_set.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/default_layout.dart';
import '../../widget/exercise_set_item_widget.dart';

class CustomExercisesPage extends StatefulWidget {
  const CustomExercisesPage({Key? key}) : super(key: key);

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
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                SizedBox(height: 12),
                Text(
                  "Create your's own style !",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    customController.exerciseSets[index].name
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          customController.exerciseSetId =
                                              customController
                                                      .exerciseSets[index].id ??
                                                  0;
                                          customController.oneChooseExercise();
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          customController.onRenameExerciseSet(
                                            title: "Update Name Exercise Set",
                                            hintText: "Enter set name",
                                            onClick: () {
                                              if (customController
                                                  .setNameController
                                                  .text
                                                  .isNotEmpty) {
                                                customController.updateExerciseSet(
                                                    ExerciseSet(
                                                        id: customController
                                                            .exerciseSets[index]
                                                            .id,
                                                        name: customController
                                                            .setNameController
                                                            .text));
                                                Get.back();
                                              } else {
                                                print('Name is empty');
                                              }
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.greenAccent,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          customController.onDeleteExerciseSet(
                                            customController
                                                    .exerciseSets[index].id ??
                                                0,
                                          );
                                        },
                                        icon: Icon(
                                          Icons.delete,
                                          color: Color(0xFF909090),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              if (customController
                                  .exerciseByExerciseSetId(
                                      customController.exerciseSets[index].id ??
                                          0)
                                  .isNotEmpty)
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: SizedBox(
                                    height: 100,
                                    child: ListView.builder(
                                      physics: ScrollPhysics(
                                          parent: BouncingScrollPhysics()),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: customController
                                          .exerciseByExerciseSetId(
                                              customController
                                                      .exerciseSets[index].id ??
                                                  0)
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int i) {
                                        final filteredCustomExercise =
                                            customController
                                                .exerciseByExerciseSetId(
                                                    customController
                                                            .exerciseSets[index]
                                                            .id ??
                                                        0)[i];
                                        return GestureDetector(
                                          onTap: () => customController
                                              .exerciseController
                                              .playVideo(
                                                  filteredCustomExercise),
                                          onLongPress: () {
                                            customController.onDeleteExercise(
                                                filteredCustomExercise.id ?? 0);
                                            print('Delete');
                                          },
                                          child: ExerciseSetItemWidget(
                                              imageUrl: filteredCustomExercise
                                                      .imageUrl ??
                                                  ''),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              if (customController
                                  .exerciseByExerciseSetId(
                                      customController.exerciseSets[index].id ??
                                          0)
                                  .isEmpty)
                                GestureDetector(
                                  onTap: () {
                                    customController.exerciseSetId =
                                        customController
                                                .exerciseSets[index].id ??
                                            0;
                                    customController.oneChooseExercise();
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        padding: EdgeInsets.all(16 / 2),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            border: Border.all(
                                              color: Color(0xFF909090),
                                            )),
                                        child: Icon(
                                          Icons.add_rounded,
                                          color: Color(0xFF909090),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(height: 18),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () => customController.onRenameExerciseSet(
                    title: "Add new Exercise Set",
                    hintText: "Enter set name",
                    onClick: () {
                      if (customController.setNameController.text.isNotEmpty) {
                        customController.addExerciseSet(ExerciseSet(
                            name: customController.setNameController.text));
                        Get.back();
                      } else {
                        print('Name is empty');
                      }
                    },
                  ),
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
