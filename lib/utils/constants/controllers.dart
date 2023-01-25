import 'package:flutter/material.dart';

class Controllers {
  static final txtName = TextEditingController(text: "");
  static final txtCode1 = TextEditingController(text: "");
  static final txtCode2 = TextEditingController(text: "");
  static final txtCode3 = TextEditingController(text: "");
  static final txtCode4 = TextEditingController(text: "");
  static final txtSearch = TextEditingController(text: "");
  static final txtEmail = TextEditingController(text: "aseel@hotmail.com");
  static final txtPassword = TextEditingController(text: "123456");
  static final txtConfirmPassword = TextEditingController(text: "");
  static final gender = TextEditingController(text: "");
  static final taskTitle = TextEditingController(text: "This is my first note");
  static final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  static clearController() {
    txtName.clear();
    txtEmail.clear();
    txtPassword.clear();
    txtConfirmPassword.clear();
    gender.clear();
  }
}
