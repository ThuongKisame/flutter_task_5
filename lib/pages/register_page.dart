import 'dart:developer';

import 'package:bcrypt/bcrypt.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_5/components/dialogs.dart';
import 'package:flutter_task_5/components/dropdown_button.dart';
import 'package:flutter_task_5/components/myButton.dart';
import 'package:flutter_task_5/components/myCheckBox.dart';
import 'package:flutter_task_5/components/my_text_field.dart';
import 'package:flutter_task_5/components/passwordTextField.dart';
import 'package:flutter_task_5/components/radio_gender.dart';
import 'package:flutter_task_5/functions/validate_form.dart';
import 'package:flutter_task_5/pages/home_page.dart';
import 'package:flutter_task_5/pages/login.dart';
import 'package:flutter_task_5/services/auth.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> handleRegister(BuildContext context) async {
    // validate

    final userNameError =
        userNameController.text.isEmpty ? 'This field is required' : Validator.userName(userNameController.text);

    final passwordError =
        passwordController.text.isEmpty ? 'This field is required' : Validator.password(passwordController.text);

    final nameError = nameController.text.isEmpty ? 'This field is required' : Validator.name(nameController.text);

    final emailError = emailController.text.isEmpty ? 'This field is required' : Validator.email(emailController.text);

    if (userNameError != null || passwordError != null || nameError != null || emailError != null) {
      // show err
    } else {
      // Nếu không có lỗi, thực hiện đăng nhập

      final String hashed = BCrypt.hashpw(passwordController.text, BCrypt.gensalt());

      try {
        Dialogs.showProgressBar(context);
        final response = await Auth.register(
            username: userNameController.text,
            password: hashed,
            email: emailController.text,
            name: nameController.text);
        if (response.statusCode == 200) {
          log('Registration successful');
          Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          Navigator.pop(context);
          Dialogs.showSnackbar(context, '${response.body}');
          log('Registration failed: ${response.statusCode}, ${response.body}');
        }
      } catch (error) {
        Navigator.pop(context);
        Dialogs.showSnackbar(context, '${error}');

        log('Error: $error');
      }
    }
  }

  List<String> dropdownOptions = ['VN', 'SN', 'CN'];

  List<String> genderOptions = ['Male', 'Female', 'Other'];

  String SelectedGender = 'Male';

  String selectedDropdownValue = 'VN';
  void handleDropdownChange(String value) {
    selectedDropdownValue = value;
  }

  void handleRadioChange(String value) {
    SelectedGender = value;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[900],
          ),
          child: SingleChildScrollView(
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
              MyTextField(
                hintText: 'Name',
                controller: nameController,
                validate: Validator.name,
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                hintText: 'User name',
                controller: userNameController,
                validate: Validator.userName,
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                controller: emailController,
                hintText: 'Email',
                validate: Validator.email,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordTextField(
                controller: passwordController,
                hintText: 'Password',
                validate: Validator.password,
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.green,
                    width: 2.0,
                  ),
                ),

                child: Row(
                  children: [
                    CustomDropdown(
                        options: dropdownOptions, selectedValue: dropdownOptions[0], onChanged: handleDropdownChange),
                    // TextField(
                    //   decoration: InputDecoration(
                    //     contentPadding: const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                    //     enabledBorder: const OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.white),
                    //         borderRadius: BorderRadius.all(Radius.circular(100))),
                    //     focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.grey.shade400),
                    //         borderRadius: BorderRadius.all(Radius.circular(100))),
                    //     fillColor: Colors.grey.shade200,
                    //     hintStyle: TextStyle(color: Colors.grey[500]),
                    //     filled: true,
                    //     hintText: 'Phone number',
                    //   ),
                    // )
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(Radius.circular(100))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.all(Radius.circular(100))),
                          fillColor: Colors.grey.shade200,
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          filled: true,
                          hintText: 'Phone number',
                        ),
                      ),
                    ),
                  ],
                ),
                // child: TextField(
                //   decoration: InputDecoration(
                //     contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                //     enabledBorder: const OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(100))),
                //     focusedBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey.shade400),
                //         borderRadius: BorderRadius.all(Radius.circular(100))),
                //     fillColor: Colors.grey.shade200,
                //     hintStyle: TextStyle(color: Colors.grey[500]),
                //     filled: true,
                //     hintText: hintText ?? '',
                //   ),
                // ),
              ),
              const SizedBox(
                height: 16,
              ),
              GenderCustom(onChanged: handleRadioChange, options: genderOptions, selectedValue: SelectedGender),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  MyCheckBox(),
                  RichText(
                    text: TextSpan(
                      text: 'I agree with the ',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: 'Rule',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' & ',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const SizedBox(
                height: 24,
              ),
              MyButton(
                title: 'Register',
                onTap: () {
                  handleRegister(context);
                },
              ),
              const SizedBox(
                height: 16,
              ),
              RichText(
                  text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                        text: 'Login',
                        style: TextStyle(color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold))
                  ])),
              const SizedBox(
                height: 50,
              ),
            ],
          )),
        ),
      ),
    ));
  }
}
