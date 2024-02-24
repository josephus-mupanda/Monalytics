import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/company.dart';

class DBServices {

  static const String baseUrl = 'https://monalytics-api.onrender.com/monalytics-api/api/v1/company';

  static Future<String> registerCompany(Company company) async {
    const url = '$baseUrl/add';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(company.toJson()),
      );
      if (response.statusCode == 200) {
        return 'Company registration successful';
      } else {
        return 'Failed to register company. Status Code: ${response.statusCode}\nResponse Body: ${response.body}';
      }
    } catch (error) {
      return 'Error during company registration: $error';
    }
  }

  static Future<String> loginCompany(String email, String password) async {
    const url = '$baseUrl/login';

    final body = {
      'email': email,
      'password': password,
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        return 'Company login successful';
      } else {
        return 'Failed to login company. Status Code: ${response.statusCode}\nResponse Body: ${response.body}';
      }
    } catch (error) {
      return 'Error during company login: $error';
    }
  }
}
