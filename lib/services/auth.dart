import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class Auth {
  static const String baseUrl = 'https://fe05.stechvn.org/api/';
  static Future<void> registerUser(
      {required String username, required String password, required String email, required String name}) async {
    final url = Uri.parse('${baseUrl}auth/register?locale=en');
    log('Register User - Params:');
    log('Username: $username');
    log('Password: $password');
    log('Email: $email');
    log('Name: $name');
    log('Name: $url');

    try {
      final response = await http.post(
        url,
        body: jsonEncode({'username': username, 'password': password, 'email': email, 'name': name}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        log('Registration successful');
      } else {
        log('Registration failed: ${response.statusCode}, ${response.body}');
      }
    } catch (error) {
      log('Error: $error');
    }
  }
}
