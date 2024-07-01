// ignore_for_file: constant_identifier_names

class Endpoints {
  static const String BrainBoxAPI = "http://10.0.2.2:5000";

  static const String login = "$BrainBoxAPI/api/v1/auth/login";
  static const String register = "$BrainBoxAPI/api/v1/auth/register";
  static const String logout = "$BrainBoxAPI/api/v1/auth/logout";
  static const String staticImage = "$BrainBoxAPI/static/img";
  static const String decodeToken = "$BrainBoxAPI/api/v1/protected/data";
  static const String updateProfile = "$BrainBoxAPI/api/v1/profile/update";
}
