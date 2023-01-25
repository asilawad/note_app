import 'package:flutter/material.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/themes/text_theme.dart';

// flutter upgrade
class AppTheme {
  //
  AppTheme._();

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ColorsConst.black,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: FontStyles.hitTextStyle,
        fillColor: ColorsConst.darkGrey,
        prefixIconColor: ColorsConst.green,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
      )),
      checkboxTheme: const CheckboxThemeData(
          side: BorderSide(
        color: ColorsConst.grey,
      )),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: ColorsConst.darkGrey),
      listTileTheme: ListTileThemeData(tileColor: ColorsConst.darkGrey));

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: ColorsConst.lightBlue,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: FontStyles.hitTextStyle,
        fillColor: ColorsConst.white,
        prefixIconColor: ColorsConst.green,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: Colors.transparent,
      )),
      checkboxTheme: const CheckboxThemeData(
          side: BorderSide(
        color: ColorsConst.grey,
      )),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 219, 217, 217)),
      listTileTheme: ListTileThemeData(tileColor: ColorsConst.white));
}
