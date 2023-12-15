import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_5/components/dropdown_button.dart';
import 'package:flutter_task_5/components/myButton.dart';
import 'package:flutter_task_5/components/myCheckBox.dart';
import 'package:flutter_task_5/components/my_text_field.dart';
import 'package:flutter_task_5/components/passwordTextField.dart';
import 'package:flutter_task_5/components/radio_gender.dart';
import 'package:flutter_task_5/pages/login.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  void handelSignIn() {
    print(selectedDropdownValue);
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
          // height: double.infinity,
          // constraints: BoxConstraints(minHeight: double.infinity),
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
                hintText: 'Full name',
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                hintText: 'User name',
              ),
              const SizedBox(
                height: 16,
              ),
              MyTextField(
                hintText: 'Email',
              ),
              const SizedBox(
                height: 16,
              ),
              const PasswordTextField(
                hintText: 'Password',
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
                onTap: handelSignIn,
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
