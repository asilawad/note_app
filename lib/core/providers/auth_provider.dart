import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/core/services/api/auth_api/auth_api.dart';
import 'package:shop_app/utils/constants/controllers.dart';
import 'package:shop_app/utils/constants/routes_constants.dart';
import 'package:shop_app/utils/routes/router.dart';
import '../models/student.dart';

class AuthProvider with ChangeNotifier {
  static final Dio dio = Dio();
  final AuthApi authApi = AuthApi();
  late String errorMessage;
  late Student user;
  late int code;
  static late String token;
  static late String refreshedToken;

  register() async {
    Response? response = await authApi.signup(
        name: Controllers.txtName.text,
        email: Controllers.txtEmail.text,
        password: Controllers.txtPassword.text,
        gender: Controllers.gender.text);

    if (response != null) AppRouter.pushNamed(RouteConstants.loginRoute);
    //  responseModeling(response, RouteConstants.loginRoute);
  }

  login() async {
    Response? response = await authApi.login(
        email: Controllers.txtEmail.text,
        password: Controllers.txtPassword.text);
    if (response != null) {
      responseModeling(response, RouteConstants.homeRoute);
      token = user.object!.token;
      refreshedToken = user.object!.refresh_token;
    }
  }

  forgetPassword() async {
    Response? response =
        await authApi.forgetPassword(email: Controllers.txtEmail.text);

    if (response != null) {
      code = response.data['code'];
      responseModeling(response, RouteConstants.resetPasswordRoute);
    }
  }

  resendPassword() async {
    Response? response = await authApi.resendPassword(
        email: Controllers.txtEmail.text,
        code: code,
        password: Controllers.txtPassword.text,
        confirmPassword: Controllers.txtConfirmPassword.text);
    if (response != null) responseModeling(response, RouteConstants.loginRoute);
  }

  logout() async {
    Response? response = await authApi.logout();
    if (response != null) {
      responseModeling(response, RouteConstants.loginRoute);
    }
  }

  responseModeling(Response response, String destination) {
    user = Student.fromJson(response.data);
    print(user);
    if (user.status) {
      Controllers.clearController();
      AppRouter.pushNamed(destination);
    }
  }

  refreshToken() {
    token = refreshedToken;
  }
}
