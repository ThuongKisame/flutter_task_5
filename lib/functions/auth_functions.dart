import 'dart:developer';

import 'package:bcrypt/bcrypt.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_5/services/auth_services.dart';
import 'package:flutter_task_5/utils/validate_form.dart';
import 'package:flutter_task_5/widgets/dialogs.dart';

import '../screens/home_screen.dart';

class AuthFunctions {
  static Future<void> handleRegister(BuildContext context,
      {required String username, required String password, required String email, required String name}) async {
    // validate

    final userNameError = username.isEmpty ? 'This field is required' : Validator.userName(username);

    final passwordError = password.isEmpty ? 'This field is required' : Validator.password(password);

    final nameError = name.isEmpty ? 'This field is required' : Validator.name(name);

    final emailError = email.isEmpty ? 'This field is required' : Validator.email(email);

    if (userNameError != null || passwordError != null || nameError != null || emailError != null) {
      // show err
    } else {
      // Nếu không có lỗi, thực hiện đăng nhập

      final String hashed = BCrypt.hashpw(password, BCrypt.gensalt());

      try {
        Dialogs.showProgressBar(context);
        final response = await Auth.register(username: username, password: hashed, email: email, name: name);
        log('log here');
        if (response.statusCode == 200) {
          log('Registration successful');
          Navigator.pop(context);

          Dialogs.showSnackbar(context, 'Register successful');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
      } on DioError catch (e) {
        if (e.response != null) {
          print('Dio error!');
          print('STATUS: ${e.response?.statusCode}');
          print('DATA: ${e.response?.data}');
          print('HEADERS: ${e.response?.headers}');
          String log = '${e.response?.data}';

          Navigator.pop(context);
          Dialogs.showSnackbar(context, log);
        } else {
          print('Error sending request!');
          Navigator.pop(context);
          Dialogs.showSnackbar(context, 'Error sending request!');
        }
      }
    }
  }
}
