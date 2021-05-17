import 'package:fitness_app_ii_example/widget/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/activity_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

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
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                      "Daily Activity",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ActivityCard(
                      value: "35",
                      unit: "exercises",
                      chartImage: 'assets/icons/line_chart.png',
                      unitIcon: 'assets/icons/exercise.png',
                    ),
                    SizedBox(height: 12),
                    ActivityCard(
                      value: "90",
                      unit: "bpm",
                      chartImage: 'assets/icons/line_chart.png',
                      unitIcon: 'assets/icons/heart_beat.png',
                    ),
                    SizedBox(height: 12),
                    ActivityCard(
                      value: "960",
                      unit: "calories",
                      chartImage: 'assets/icons/line_chart.png',
                      unitIcon: 'assets/icons/fire.png',
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16 * 1.5),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "GOOD",
                                  style: Theme.of(context).textTheme.headline3.copyWith(
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
                                Icon(Icons.star_rounded, color: Theme.of(context).primaryColor),
                                Icon(Icons.star_rounded, color: Theme.of(context).primaryColor),
                                Icon(Icons.star_rounded, color: Theme.of(context).primaryColor),
                                Icon(Icons.star_rounded, color: Theme.of(context).primaryColor),
                                Icon(Icons.star_half_rounded, color: Theme.of(context).primaryColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
