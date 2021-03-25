import 'package:blog/values/regex.dart';

class BlogValidators {

  static String isRequired(String text) {
    if (text == null || text.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String minLenght(String text, [int lenght = 6]) {
    if (text == null || text.isEmpty) {
      return "This field is required";
    }
    if (text.length < lenght) {
      return "This field must contain at least $lenght characters";
    }
    return null;
  }

  static String email(String text) {
    if (text == null || text.isEmpty) {
      return "Email is required";
    }
    if (!mailRegEx.hasMatch(text)) {
      return "Email is invalid";
    }
    return null;
  }
}
