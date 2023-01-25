import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants/controllers.dart';

class AppearanceProvider extends ChangeNotifier {
  bool isDarkModeOn = true;
  bool checkBoxValue = false;
  bool isEnglish = true;
  bool isListEmpty = true;
  String selectGender = 'M';
  bool isLoading = false;

  loader(bool newValue) {
    isLoading = newValue;
    notifyListeners();
  }

  changeGender(String newValue) {
    selectGender = newValue;
    Controllers.gender.text = selectGender;
    notifyListeners();
  }

  updateTheme(bool newValue) {
    isDarkModeOn = newValue;
    notifyListeners();
  }

  void changeCheckBoxValue(bool checkBoxValue) {
    this.checkBoxValue = checkBoxValue;
    notifyListeners();
  }

  updateLanguage(bool newValue) {
    isEnglish = newValue;
    notifyListeners();
  }

  changeImageVisibility(bool newValue) {
    isListEmpty = newValue;
    notifyListeners();
  }
}
