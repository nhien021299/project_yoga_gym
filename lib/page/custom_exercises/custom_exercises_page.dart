import 'package:fitness_app_ii_example/widget/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Center(
        child: Text("Custom Exercises Page"),
      ),
    );
  }
}
