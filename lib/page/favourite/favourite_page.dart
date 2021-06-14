import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/default_layout.dart';
import '../../widget/exercises_item_widget.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key key}) : super(key: key);

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
                  "Favourite",
                  style: Theme.of(context).textTheme.headline3.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Divider(
                  height: 32,
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
                                image: "assets/images/category_work_out.png",
                                title: "Work Out",
                                value: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/workout2.png",
                                title: "Work Out",
                                value: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/workout3.png",
                                title: "Work Out",
                                value: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/crunch.png",
                                title: "Work Out",
                                value: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: ExercisesItemWidget(
                                image: "assets/images/crunch.png",
                                title: "Work Out",
                                value: 15),
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
      ),
    );
  }
}
