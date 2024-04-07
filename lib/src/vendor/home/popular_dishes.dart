import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PopularDish extends StatefulWidget {
  @override
  _PopularDishState createState() => _PopularDishState();
}

class _PopularDishState extends State<PopularDish> {
  String day = 'Sunday';
  String time = 'Morning';

  String dish = '';
  List<String> days = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List<String> times = ['Morning', 'Afternoon', 'Snacks', 'Evening-Dinner'];

  Future<void> handleSubmit() async {
    try {
      var data = {
        'day_name': day,
        'time_slot': time,
      };
      // var response = await http.post(
      //   Uri.parse('http://localhost:8000/popularDish'),
      //   body: json.encode(data),
      // );
      // print(
      //     'This is the response for the popular dish ${json.decode(response.body)['Popular dish']}');
      setState(() {
        // dish = json.decode(response.body)['Popular dish'];
        dish = "Paneer";
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              hint: Text('Select Day'),
              value: day,
              onChanged: (String? newValue) {
                setState(() {
                  day = newValue!;
                });
              },
              items: days.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            DropdownButton<String>(
              hint: Text('Select Time'),
              value: time,
              onChanged: (String? newValue) {
                setState(() {
                  time = newValue!;
                });
              },
              items: times.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: handleSubmit,
              child: Text('Submit'),
            ),
            SizedBox(
              height: 10,
            ),
            if (dish != '')
              Visibility(
                visible: dish.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('The popular dish for the given day and time is',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold)),
                        Text(dish,
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
