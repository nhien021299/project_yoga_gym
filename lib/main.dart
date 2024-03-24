import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dbhelper/init_db_helper.dart';
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
  late final Data dbExercise;
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
