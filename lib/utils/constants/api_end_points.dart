class ApiEndPoints {
  ApiEndPoints._();
  static const baseUrl = "http://demo-api.mr-dev.tech/api/";
  static const register = "students/auth/register";
  static const login = "students/auth/login";
  static const forgetPassword = "students/auth/forget-password";
  static const resetPassword = "students/auth/reset-password";
  static const logout = "students/auth/logout";
  static const tasks = "tasks";
  static const connectTimeout = 15000;
  static const receiveTimeout = 15000;
}
