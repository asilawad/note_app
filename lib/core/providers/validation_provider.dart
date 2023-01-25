import 'package:flutter/material.dart';

class ValidationProvider with ChangeNotifier {
 static String? validatePassword(value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length < 6) {
      return "Should be at least 6 Characters";
    } else if (value.length > 15) {
      return "Should Not be more than 15 Characters";
    } else {
      return null;
    }
  }

  static String? validateEmail(value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]")
        .hasMatch(value)) {
      return "Not valid email";
    } else if (value.length > 20) {
      return "Should Not be more than 15 Characters";
    } else {
      return null;
    }
  }

   static String? validateName(value) {
    if (value!.isEmpty) {
      return "Required";
    } else if (value.length < 3) {
      return "Should be at least 3 Characters";
    } else {
      return null;
    }
  }
}
