import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/core/services/api/dio_client.dart';
import 'package:shop_app/core/services/api/dio_exception.dart';
import 'package:shop_app/utils/constants/api_end_points.dart';

class AuthApi {
  final DioClient dioClient = DioClient(AuthProvider.dio);

  signup(
      {required String name,
      required String email,
      required String password,
      required String gender}) async {
    try {
      print("User Registration");
      Response response = await dioClient.post(ApiEndPoints.register, {
        "full_name": name,
        "email": email,
        "password": password,
        "gender": gender
      });

      return response;
    } catch (e) {
      print("Register request failed");
    }
  }

  login({required String email, required String password}) async {
    try {
      Response response = await dioClient
          .post(ApiEndPoints.login, {"email": email, "password": password});
      return response;
    } catch (e) {
      print("authapi catch");
    }
  }

  forgetPassword({required String email}) async {
    try {
      Response response =
          await dioClient.post(ApiEndPoints.forgetPassword, {"email": email});
      return response;
    } catch (e) {
      print("forgetPassword request failed");
    }
  }

  resendPassword(
      {required String email,
      required int code,
      required String password,
      required String confirmPassword}) async {
    try {
      Response response = await dioClient.post(ApiEndPoints.resetPassword, {
        "email": email,
        "code": code,
        "password": password,
        "password_confirmation": confirmPassword
      });
      return response;
    } catch (e) {
      print("resendPassword request failed");
    }
  }

  logout() async {
    try {
      Response response = await dioClient.get(ApiEndPoints.logout,
          options: Options(headers: {
            "Authorization": "Bearer ${AuthProvider.token}",
            "Accept": "application/json",
          }));
      return response;
    } catch (e) {
      print("logout request failed");
    }
  }
}
