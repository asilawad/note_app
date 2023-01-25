import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    print("Dio Error");
    Map<DioErrorType, String> errors = {
      DioErrorType.cancel: "Request to API server was cancelled",
      DioErrorType.connectTimeout: "Connection timeout with API server",
      DioErrorType.receiveTimeout:
          "Receive timeout in connection with API server",
      DioErrorType.sendTimeout: "Send timeout in connection with API server",
      DioErrorType.other: dioError.message.contains("SocketException")
          ? "No Internet"
          : "Unexpected error occurred",
    };
    print(dioError.error);
    message = errors[dioError.type] ??
        _handleError(dioError.response!.statusCode, dioError.response!.data);
  }

  @override
  toString() => message;
}

String _handleError(int? statusCode, dynamic error) {
  print("handleError");
  Map<int, String> responseErrors = {
    301: '${error['message']}',
    400: '${error['message']}',
    401: '${error['message']}',
    403: '${error['message']}',
    404: "${error['message']}",
    500: '${error['message']}',
    502: '${error['message']}',
  };
  return responseErrors[statusCode] ?? error['message'];
}
