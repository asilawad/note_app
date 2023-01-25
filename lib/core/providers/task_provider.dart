import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/core/services/api/task_api/task_api.dart';
import 'package:shop_app/utils/constants/controllers.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  static final Dio dio = Dio();
  bool hasData = false;
  late Task task;
  final TaskApi taskApi = TaskApi();
  late List<TaskData> taskList;
  List<TaskData> searchResult = [];
  List<List<TaskData>> filteredData = [];
  bool didSearch = true;

  createTask() async {
    Response? response = await taskApi.create(Controllers.taskTitle.text);
    print("create provider");
    if (response != null) {
      task = Task.fromJson(response.data);
      filteredData[0].add(task.data as TaskData);
    }
  }

  fetchTasks() async {
    Response? response = await taskApi.fetch();
    if (response != null) {
      task = Task.fromJson(response.data);
      taskList = task.data;
      hasData = true;
      filter();
      notifyListeners();
    }
  }

  updateTask(
    TaskData task,
  ) async {
    Response? response =
        await taskApi.update(Controllers.taskTitle.text, task.id);
    if (response != null) {
      int index = taskList.indexOf(task);
      taskList[index].title = Controllers.taskTitle.text;
      notifyListeners();
    }
  }

  deleteTask(int taskId) async {
    Response? response = await taskApi.delete(taskId);
    print(response);
    print("delete provider");
    if (response != null) {
      print("ffffffffffffffff");

      for (int i = 0; i < filteredData.length; i++) {
        filteredData[i].removeWhere((e) => e.id == taskId);
      }

      notifyListeners();
    }
    // }
  }

  search(String text) {
    searchResult.clear();
    searchResult = taskList
        .where((task) => task.title.toLowerCase().contains(text))
        .toList();
    (searchResult.isEmpty) ? didSearch = false : didSearch = true;
    notifyListeners();
  }

  filter() {
    List<TaskData> filterList = [...taskList];
    while (filterList.isNotEmpty) {
      List<TaskData> subList = filterList
          .where((task) => task.created_at.split("T")[0].contains(
              filterList[filterList.length - 1].created_at.split("T")[0]))
          .toList();
      filteredData.add(subList);
      filterList.removeWhere((task) => subList.contains(task));
    }
    sort();
  }

  sort() {
    filteredData.sort((subList1, subList2) =>
        int.parse(subList2[0].created_at.substring(8, 10))
            .compareTo(int.parse(subList1[0].created_at.substring(8, 10))));
  }
}
