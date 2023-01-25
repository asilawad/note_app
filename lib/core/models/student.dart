class Student {
  final bool status;
  final String message;
  final int? code;
  final Data? object;
  Student(
      {required this.status,
      required this.message,
      required this.code,
      this.object});

  factory Student.fromJson(Map<String, dynamic> map) => Student(
      status: map['status'],
      message: map['message'],
      code: map['code'],
      object: map['object'] != null ? Data.fromJson(map['object']) : null);

  @override
  toString() =>
      "status: $status, message: $message, code: $code, object: $object";
}

class Data {
  final int id;
  final String full_name;
  final String email;
  final String gender;
  final String? fcm_token;
  final String token;
  final String refresh_token;
  final bool is_active;

  Data(
      {required this.id,
      required this.full_name,
      required this.email,
      required this.gender,
      required this.fcm_token,
      required this.token,
      required this.refresh_token,
      required this.is_active});

  factory Data.fromJson(Map<String, dynamic> dataMap) => Data(
      id: dataMap['id'],
      full_name: dataMap['full_name'],
      email: dataMap['email'],
      gender: dataMap['gender'],
      fcm_token: dataMap['fcm_token'],
      token: dataMap['token'],
      refresh_token: dataMap['refresh_token'],
      is_active: dataMap['is_active']);

  @override
  toString() =>
      "id: $id, full_name: $full_name, email: $email, gender: $gender";
      // ,fcm_token: $fcm_token, token: $token, refresh_token: $refresh_token, is_active: $is_active";
}
