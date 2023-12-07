import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  const MyCheckBox({Key? key}) : super(key: key);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.green,
      value: _value,
      fillColor: MaterialStateColor.resolveWith((states) => Colors.white),
      onChanged: (bool? value) {
        setState(() {
          _value = value ?? false;
        });
      },
    );
  }
}
