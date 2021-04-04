import 'package:intl/intl.dart';

class FormatHelper {
  static String formatDateTime(DateTime dateTime,
      {String pattern = "E, d MMM yyyy - HH:mm"}) {
    if (dateTime == null) {
      return "";
    }
    final dateFormatter = DateFormat(pattern);
    return dateFormatter.format(dateTime);
  }
}
