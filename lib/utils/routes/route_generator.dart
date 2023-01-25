import 'package:flutter/material.dart';
import 'package:shop_app/ui/view/auth/forget_password_view.dart';
import 'package:shop_app/ui/view/home/search/search_view.dart';
import 'package:shop_app/utils/constants/routes_constants.dart';
import 'package:shop_app/ui/view/auth/signup_view.dart';
import '../../ui/view/auth/login_view.dart';
import '../../ui/view/auth/reset-ptassword_view.dart';
import '../../ui/view/home/home_view.dart';
import '../../ui/view/home/settings/language_view.dart';
import '../../ui/view/home/settings/settings_view.dart';

class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.signupRoute:
        return MaterialPageRoute(builder: (context) => SignupView());

      case RouteConstants.loginRoute:
        return MaterialPageRoute(builder: (context) => LoginView());

      case RouteConstants.forgetPasswordRoute:
        return MaterialPageRoute(builder: (context) => ForgetPassword());

      case RouteConstants.resetPasswordRoute:
        return MaterialPageRoute(builder: (context) => ResetPasswordView());

      case RouteConstants.homeRoute:
        return MaterialPageRoute(builder: (context) => HomeView());

      case RouteConstants.settingsRoute:
        return MaterialPageRoute(builder: (context) => SettingsView());

      case RouteConstants.languageRoute:
        return MaterialPageRoute(builder: (context) => LanguageView());

      case RouteConstants.searchRoute:
        return MaterialPageRoute(builder: (context) => SearchView());

      default:
        return MaterialPageRoute(builder: (context) => LoginView());
    }
  }
}
