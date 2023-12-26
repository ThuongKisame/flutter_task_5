import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  final String? hintText;
  final controller;
  final String? Function(String) validate;

  const PasswordTextField({Key? key, this.hintText, required this.controller, required this.validate})
      : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  String? errorText;
  bool hasError = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
            onChanged: (value) {
              setState(() {
                errorText = widget.validate(value);
                hasError = errorText != null;
              });
            },
            controller: widget.controller,
            obscureText: _obscureText,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              fillColor: Colors.grey.shade200,
              hintStyle: TextStyle(color: Colors.grey[500]),
              filled: true,
              hintText: widget.hintText ?? '',
              suffixIcon: GestureDetector(
                onTap: _togglePasswordVisibility,
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.green,
                ),
              ),
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
