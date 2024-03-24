import 'package:flutter/material.dart';

class MessDropdown extends StatefulWidget {
  @override
  _MessDropdownState createState() => _MessDropdownState();
}

class _MessDropdownState extends State<MessDropdown> {
  String? selectedMess = 'Kumar';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15), // Rounded corners
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedMess,
            isExpanded: true,
            iconSize: 30,
            onChanged: (String? newValue) {
              setState(() {
                selectedMess = newValue;
              });
            },
            items: <String>['Kumar', 'Galav', 'Sree Sai']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
