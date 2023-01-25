class Task {
  final bool status;
  final String message;
  final data;
  Task({required this.status, required this.message, required this.data});

  factory Task.fromJson(Map<String, dynamic> map) {
    List<TaskData>? dataList;
    if (map['data'] is List) {
      List<dynamic> tasks = map['data'];
      dataList = tasks.map((e) => TaskData.fromJson(e)).toList();
    }
    return Task(
        status: map['status'],
        message: map['message'],
        data: (map['data'] is List)
            ? dataList
            : map['data'] != null
                ? TaskData.fromJson(map['data'])
                : null);
  }

  @override
  toString() => "status: $status, message: $message, data: $data";
}

class TaskData {
   String title;
  final dynamic student_id;
  final String updated_at;
  final String created_at;
  final int id;
  final bool is_done;

  TaskData(
      {required this.title,
      required this.student_id,
      required this.updated_at,
      required this.created_at,
      required this.id,
      required this.is_done});

  factory TaskData.fromJson(Map<String, dynamic> dataMap) => TaskData(
      title: dataMap['title'],
      student_id: dataMap['student_id'],
      updated_at: dataMap['updated_at'],
      created_at: dataMap['created_at'],
      id: dataMap['id'],
      is_done: dataMap['is_done']);

  @override
  toString() =>
      "title: $title, student_id: $student_id, updated_at: $updated_at, created_at: $created_at, id: $id, is_done: $is_done";
}
