import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  const MyTextField({super.key, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.green,
          width: 2.0,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(100))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          fillColor: Colors.grey.shade200,
          hintStyle: TextStyle(color: Colors.grey[500]),
          filled: true,
          hintText: hintText ?? '',
        ),
      ),
    );
  }
}
