import 'package:fitness_app_ii_example/controller/favorite_controller.dart';
import 'package:fitness_app_ii_example/page/exercise_video/exercise_video_page.dart';
import 'package:fitness_app_ii_example/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/default_layout.dart';
import '../../widget/exercises_item_widget.dart';

class FavouritePage extends StatelessWidget {
  FavouritePage({Key key}) : super(key: key);
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
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Favourite Exercises",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Divider(
                  height: 32,
                ),
                Expanded(
                  child: SizedBox(
                    child: SingleChildScrollView(
                        child: GetX<FavoriteController>(
                            init: FavoriteController(),
                            builder: (controller) {
                              return Column(
                                children: List.generate(
                                  controller.listFavorites.value.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: defaultPadding),
                                    child: GestureDetector(
                                      onTap: () => controller.exerciseController
                                          .playVideo(controller
                                              .listFavorites.value[index]),
                                      child: ExercisesItemWidget(
                                        image: controller.listFavorites
                                            .value[index].imageUrl,
                                        title: controller
                                            .listFavorites.value[index].name,
                                        value: controller
                                            .listFavorites.value[index].reps,
                                        isFavorite: controller.listFavorites
                                            .value[index].isFavourite,
                                        onTap: () => controller
                                            .exerciseController
                                            .updateFavorites(controller
                                                .listFavorites.value[index]),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
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
