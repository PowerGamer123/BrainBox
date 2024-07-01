// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'package:my_app/endpoints/endpoints.dart';
import 'dart:convert';

class DataService {
  static Future<http.Response> sendLoginData(
    String username,
    String password,
  ) async {
    final url = Uri.parse(Endpoints.login);
    final data = {'username': username, 'password': password};

    return await http.post(url, body: data);
  }

  static Future<http.Response?> getUserInfo(String accessToken) async {
    final Uri url = Uri.parse(Endpoints.decodeToken);
    final Map<String, String> headers = {
      'Authorization': 'Bearer $accessToken'
    };

    try {
      final http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        return response;
      } else {
        print(
            'Failed to retrieve user information. Status code: ${response.statusCode}');
        return null;
      }
    } on http.ClientException catch (e) {
      print('Client error: $e');
      return null;
    } catch (e) {
      print('Error fetching user information: $e');
      return null;
    }
  }

  static Future<http.Response> updateUser(
    int userID,
    String? email,
    String? full_name,
    String? phone,
  ) async {
    final url = Uri.parse('${Endpoints.updateProfile}/$userID');
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      'email': email,
      'full_name': full_name,
      'phone': phone,
    });

    return await http.post(url, headers: headers, body: body);
  }

  static Future<http.Response> getUserAdditionalInfo(int userID) async {
    final url = Uri.parse('http://10.0.2.2:5000/api/v1/profile/read/$userID');

    return await http.get(url);
  }
}
