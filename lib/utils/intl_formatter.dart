import 'package:intl/intl.dart';

class AppFormatter {
  static String formatDate(String date, {String format}) {
    DateFormat formatter = format == null ? DateFormat.yMd()  : DateFormat(format);
    if (date == null || date.isEmpty) {
      return formatter.format(DateTime.now());
    }
    final datetime = DateTime.tryParse(date);
    if (datetime == null) {
      return formatter.format(DateTime.now());
    }
    return formatter.format(datetime);
  }


  static String formatTimeDate(String date) {
    return formatDate(date, format: 'hh:mm a, dd MMMM yyyy');
  }

  static String formatTime(String date) {
    return formatDate(date, format: 'hh:mm a');
  }

  static String formatDateShort(String date) {
    return formatDate(date, format: 'MMMM d, y');
  }

  static String formatDateTime(String date) {
    return formatDate(date, format: 'y/M/d H:mm:s');
  }

  static String formatDateMedium(String date) {
    return formatDate(date, format: 'd MMMM, y. H:mm:s');
  }

  static String formatDateLong(String date) {
    return formatDate(date, format: DateFormat.yMMMMEEEEd().pattern);
  }

  static String capitalise(String text) {
    try {
      if (text == null || text.isEmpty) {
      return text ?? "";
    } else if (text.length == 1) {
      return text.toUpperCase();
    } else {
      final textSpan = text.split(" ").map((it) {
        if (it.isEmpty) {
          return it;
        }
        if (it.length == 1) {
          return it.toUpperCase();
        }
        final firstChar = it[0];
        return "${firstChar.toUpperCase()}${it.substring(1).toLowerCase()}";
      });
      return textSpan.join(" ");
    }
    } catch(_) {
      return text;
    }
  }
}
