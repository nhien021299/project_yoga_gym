import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'page/home/main_page.dart';
import 'utils/binding_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
