import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Auth {
  static String baseUrl = dotenv.env['BASE_URL'] ?? '';

  static Future<void> registerUser(
      {required String username, required String password, required String email, required String name}) async {
    final url = Uri.parse('${baseUrl}auth/register?locale=en');
    log('Register User - Params:');
    log('Username: $username');
    log('Password: $password');
    log('Email: $email');
    log('Name: $name');
    log('BaseUrl: $url');

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

  static register({required String username, required String password, required String email, required String name}) {
    final url = Uri.parse('${baseUrl}auth/register?locale=en');
    return http.post(
      url,
      body: jsonEncode({'username': username, 'password': password, 'email': email, 'name': name}),
      headers: {'Content-Type': 'application/json'},
    );
  }
}
