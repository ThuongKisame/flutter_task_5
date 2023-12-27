import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String) validate;

  const MyTextField({Key? key, this.hintText, required this.controller, required this.validate}) : super(key: key);

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  String? errorText;
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: hasError ? Colors.red : Colors.green,
              width: 2.0,
            ),
          ),
          child: TextField(
            controller: widget.controller,
            onChanged: (value) {
              setState(() {
                errorText = widget.validate(value);
                hasError = errorText != null;
              });
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              fillColor: Colors.grey.shade200,
              hintStyle: TextStyle(color: Colors.grey[500]),
              filled: true,
              hintText: widget.hintText ?? '',
            ),
          ),
        ),
        if (hasError)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
              child: Text(
                errorText ?? '',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
