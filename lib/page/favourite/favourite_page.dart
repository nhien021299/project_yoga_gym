import '../../controller/favorite_controller.dart';
import '../../utils/constant.dart';
import '../../utils/string_constant.dart';
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
                                  controller.favourites.value.length,
                                  (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: defaultPadding),
                                    child: GestureDetector(
                                      onTap: () => controller.exerciseController
                                          .playVideo(controller
                                              .favourites.value[index]),
                                      child: ExercisesItemWidget(
                                        image: controller
                                            .favourites.value[index].imageUrl,
                                        title: controller
                                            .favourites.value[index].name,
                                        value: controller
                                            .favourites.value[index].reps,
                                        isFavorite: controller.favourites
                                            .value[index].isFavourite,
                                        onTap: () => controller
                                            .exerciseController
                                            .updateFavorites(
                                          controller.favourites.value[index],
                                        ),
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
