// registration_controller.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/register_model.dart';

class RegistrationController {
  static const String _baseUrl = 'http://13.127.81.177:8000/api';

  Future<bool> registerUser(User user) async {
    try {
      var url = Uri.parse('$_baseUrl/registers/');
      var response = await http.post(
        url,
        body: jsonEncode(user.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Registration successful
        return true;
      } else {
        // Log the error response body for debugging
        print('Error: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      // Handle network or server errors
      print('Network/Server error: $e');
      return false;
    }
  }
}

