import 'package:flutter/material.dart';

class GenderCustom extends StatefulWidget {
  final List<String> options;
  String selectedValue;
  final ValueChanged<String> onChanged;

  GenderCustom({Key? key, required this.onChanged, required this.options, required this.selectedValue})
      : super(key: key);

  @override
  State<GenderCustom> createState() => _GenderCustomState();
}

class _GenderCustomState extends State<GenderCustom> {
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
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            child: Text(
              'Gender:',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: widget.options
                  .map((option) => GestureDetector(
                      onTap: () {
                        widget.onChanged(option);
                        setState(() {
                          widget.selectedValue = option;
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          option,
                          style: TextStyle(
                              color: widget.selectedValue == option ? Colors.green : Colors.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      )

                      //  Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 6),
                      //   padding: EdgeInsets.all(8),
                      //   decoration: BoxDecoration(
                      //     color: widget.selectedValue == option ? Colors.green : Colors.grey,
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      //   child: Text(
                      //     option,
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
