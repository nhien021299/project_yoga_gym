import 'package:fluttertoast/fluttertoast.dart';

class ToastHelper {
  static void showToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      fontSize: 14.0
    );
  }
}
