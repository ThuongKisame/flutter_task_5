import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> options;
  String selectedValue;
  final ValueChanged<String> onChanged;

  CustomDropdown({
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
      dropdownColor: Colors.grey[900],
      value: widget.selectedValue,
      items: widget.options.map((option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option, style: TextStyle(color: Colors.white)),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          widget.selectedValue = value!;
          widget.onChanged(value);
        });
      },
    );
  }
}
