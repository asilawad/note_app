import 'package:dio/dio.dart';
import 'package:shop_app/core/providers/auth_provider.dart';
import 'package:shop_app/core/services/api/dio_client.dart';
import 'package:shop_app/utils/constants/api_end_points.dart';
import 'package:shop_app/utils/constants/routes_constants.dart';
import 'package:shop_app/utils/routes/router.dart';
import '../../../providers/task_provider.dart';

class TaskApi {
  final DioClient dioClient = DioClient(TaskProvider.dio);

  create(String taskTitle) async {
    try {
      Response response = await dioClient.post(
          ApiEndPoints.tasks, {"title": taskTitle},
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer ${AuthProvider.token}"
          }));

      print(response);
      return response;
    } catch (e) {
      print("Create Task request failed");
    }
  }

  fetch() async {
    try {
      Response response = await dioClient.get(ApiEndPoints.tasks + "/",
          options: Options(headers: {
            "X-Requested-With": "XMLHttpRequest",
            "Authorization": "Bearer ${AuthProvider.token}"
          }));

      return response;
    } catch (e) {
      print("fetch request failed");
    }
  }

  update(String taskTitle, int id) async {
    try {
      Response response =
          await dioClient.put(ApiEndPoints.tasks + "/$id", {"title": taskTitle},
              options: Options(headers: {
                "Authorization": "Bearer ${AuthProvider.token}",
                "X-Requested-With": "XMLHttpRequest"
              }));
      return response;
    } catch (e) {
      print("update request failed");
    }
  }

  delete(int id) async {
    try {
      Response response = await dioClient.delete(
          ApiEndPoints.tasks + "/$id", {"title": "newTitle"},
          options: Options(headers: {
            "Authorization": "Bearer ${AuthProvider.token}",
            "X-Requested-With": "XMLHttpRequest"
          }));
      return response;
    } catch (e) {
      print("delete request failed");
    }
  }
}
