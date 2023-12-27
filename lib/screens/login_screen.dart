import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_5/widgets/my_check_box.dart';
import 'package:flutter_task_5/widgets/my_text_field.dart';
import 'package:flutter_task_5/utils/validate_form.dart';
import 'package:flutter_task_5/screens/register_screen.dart';

import '../widgets/password_text_field.dart';
import '../widgets/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleLogin() {
    final userNameError =
        userNameController.text.isEmpty ? 'This field is required' : Validator.userName(userNameController.text);

    final passwordError =
        passwordController.text.isEmpty ? 'This field is required' : Validator.password(passwordController.text);

    if (userNameError != null || passwordError != null) {
      // show err
    } else {
      // Nếu không có lỗi, thực hiện đăng nhập
      log(userNameController.text);
      log(passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[900],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Welcome to DAC',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyTextField(hintText: 'User name', controller: userNameController, validate: Validator.userName),
                      const SizedBox(
                        height: 16,
                      ),
                      PasswordTextField(controller: passwordController, validate: Validator.password),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              MyCheckBox(),
                              const Text(
                                'Remember Me',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      MyButton(
                        title: 'Login',
                        onTap: handleLogin,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'Do have an account? ',
                              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                  },
                                text: 'Register',
                                style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold))
                          ])),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
