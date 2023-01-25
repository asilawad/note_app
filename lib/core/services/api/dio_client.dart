import 'package:dio/dio.dart';
import 'package:shop_app/core/services/api/dio_interceptor.dart';

import '../../../utils/constants/api_end_points.dart';

class DioClient {
  Dio _dio;

  DioClient(this._dio) {
    _dio
    
      ..interceptors.add(DioInterceptor())
      ..options.baseUrl = ApiEndPoints.baseUrl
      ..options.connectTimeout = ApiEndPoints.connectTimeout
      ..options.receiveTimeout = ApiEndPoints.receiveTimeout
      ..options.responseType = ResponseType.json;
  }

  Future<Response> get(String endPoint,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      Response response = await _dio.get(endPoint,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String endPoint, Map<String, dynamic> data,
      {Map<String, dynamic>? queryParameter,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      Response response = await _dio.post(endPoint,
          data: data,
          queryParameters: queryParameter,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(String endPoint, Map<String, dynamic> data,
      {Map<String, dynamic>? queryParameter,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      Response response = await _dio.put(endPoint,
          data: data,
          queryParameters: queryParameter,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String endPoint,
    Map<String, dynamic> data, {
    Map<String, dynamic>? queryParameter,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.delete(
        endPoint,
        data: data,
        queryParameters: queryParameter,
        options: options,
        cancelToken: cancelToken,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
