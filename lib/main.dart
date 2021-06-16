import 'package:fitness_app_ii_example/dbhelper/init_db_helper.dart';
import 'package:fitness_app_ii_example/utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import 'data/exercise_data.dart';
import 'page/home/main_page.dart';
import 'utils/binding_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Data dbExercise;
  @override
  void initState() {
    dbExercise = Data();
    super.initState();
  }

  @override
  void dispose() {
    Data().closeDb();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingController(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFff6369),
      ),
      home: MainPage(),
    );
  }
}
