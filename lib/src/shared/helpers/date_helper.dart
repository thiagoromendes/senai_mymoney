import 'package:intl/intl.dart';

class DateHelper {
  static String getFormatDMY(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String getFormatYMDT(DateTime date) {
    final DateFormat formatter = DateFormat("yyyy-MM-ddThh:mm:ss.000'Z'");
    return formatter.format(date);
  }

  static String getDayOfMonth() {
    final DateFormat formatter = DateFormat('dd');
    return formatter.format(DateTime.now());
  }

  static DateTime getParseDate(String date) {
    return DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
  }
}
