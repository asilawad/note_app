import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/core/providers/appearance_provider.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/core/providers/task_provider.dart';
import 'package:shop_app/core/services/api/dio_exception.dart';
import 'package:shop_app/core/services/api/task_api/task_api.dart';
import 'package:shop_app/ui/shared/widgets/alert_dialog.dart';
import 'package:shop_app/utils/constants/colors_constants.dart';
import 'package:shop_app/utils/themes/text_theme.dart';
import '../../../utils/routes/router.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("onRequest dio interceptor");

    AppRouter.navigatorKey.currentContext!
        .read<AppearanceProvider>()
        .loader(true);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("onResponse dio interceptor");

    AppRouter.navigatorKey.currentContext!
        .read<AppearanceProvider>()
        .loader(false);
    ScaffoldMessenger.of(AppRouter.navigatorKey.currentContext!)
        .showSnackBar(SnackBar(
            backgroundColor: ColorsConst.blue,
            content: Text(
              response.data['message'],
              style: FontStyles.textButtonStyle,
            )));

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError dioError, ErrorInterceptorHandler handler) {
    print("onError dio interceptor");

    AppRouter.navigatorKey.currentContext!
        .read<AppearanceProvider>()
        .loader(false);
    final errorMessage = DioExceptions.fromDioError(dioError).toString();
    if (errorMessage.contains("401")) {
      AppRouter.navigatorKey.currentContext!
          .read<AuthProvider>()
          .refreshToken();
    }
    print(errorMessage);
    showDialog(
      context: AppRouter.navigatorKey.currentContext!,
      builder: (BuildContext context) => AlertDialogCustom(
          icon: Icons.error_outlined, errorMessage: errorMessage),
    );
  }
}
