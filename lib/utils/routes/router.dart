import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static pushNamed(String routeName) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  static pushNamedReplacement(String routeName) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  static pop(String routeName) {
    navigatorKey.currentState!.pop(routeName);
  }
}
