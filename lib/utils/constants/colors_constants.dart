import 'package:flutter/material.dart';

class ColorsConst {
  ColorsConst._();
  static const transparent = Colors.transparent;

  static const black = Color(0xff252525);
  static const darkGrey = Color(0xff3B3B3B);
  static const darkGey200 = Color(0xff505050);
  static const grey400 = Color.fromARGB(255, 139, 139, 139);
  static final gredientColor = Paint()
    ..shader = const LinearGradient(
      colors: [ColorsConst.lightGreen, ColorsConst.blue],
    ).createShader(const Rect.fromLTWH(100.0, 100.0, 150.0, 200.0));
  static const lightGrey = Color(0xffBDBDBD);
  static const grey = Color.fromRGBO(189, 189, 189, 1);
  static const green = Color(0xff21AA93);
  static const lightGreen = Color(0xff6BF4DE);
  static const blue = Color(0xff0175E1);
  static const lightBlue = Color(0xffECF1FA);
  static const white = Color(0xffFFFFFF);
}
