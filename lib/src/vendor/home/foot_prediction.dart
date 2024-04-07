import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'dart:convert';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_string.dart';

class MessPredictor extends StatefulWidget {
  @override
  _MessPredictorState createState() => _MessPredictorState();
}

class _MessPredictorState extends State<MessPredictor> {
  String mess = 'mess_mess-kumard';
  String day = 'Sunday';
  String food = '';
  int time = 0;
  String prediction = '';
  List<String> filteredFoods = [];

  // Sample list of food items
  List<String> foodItems = [
    'Chicken Biryani',
    'Pizza',
    'Pasta',
    'Burger',
    'Salad',
    'Sandwich',
  ];

  List<String> messOptions = [
    'mess_mess-galav',
    'mess_mess-kumard',
    'mess_mess-ssai'
  ];
  List<String> dayOptions = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  void handleFoodSearch(String input) {
    setState(() {
      food = input;
      filteredFoods = foodItems
          .where((item) => item.toLowerCase().startsWith(input.toLowerCase()))
          .toList();
    });
  }

  void handleSubmit() async {
    try {
      // Construct the data object in the required format
      _isLoading = true;
      var data = {
        "${mess}": 1.0,
        "day_name_${day}": 1.0,
        "Food_${food}": 1.0,
        "time_minute": 1199.0,
      };
      print(json.encode(data));

      // Send the data to the backend
      var response = await http.post(
        Uri.parse('http://localhost:8000/predict'),
        body: json.encode(data),
      );
      setState(() {
        prediction = json.decode(response.body)['Expected Footprint is:'];
        _isLoading = false;
      });
    } catch (err) {
      print(err);
    }
  }

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    final size = mediaQuery.size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Predict Footprint"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Image(image: AssetImage(footPrintsImage)),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<String>(
                value: mess,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      mess = newValue;
                    });
                  }
                },
                items:
                    messOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.replaceAll('_', ' ')),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: DropdownButton<String>(
                value: day,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      day = newValue;
                    });
                  }
                },
                items: dayOptions.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.food_bank),
                labelText: "Search Food",
                hintText: messPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
              onChanged: handleFoodSearch,
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: filteredFoods.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredFoods[index]),
                );
              },
            ),
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.timelapse),
                labelText: "Select Time",
                hintText: messPassword,
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
              onChanged: (String value) {
                setState(() {
                  time = int.parse(value);
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(),
                  foregroundColor:
                      isDarkMode ? messSecondaryColor : messWhiteColor,
                  backgroundColor:
                      isDarkMode ? messWhiteColor : messSecondaryColor,
                  side: BorderSide(
                    color: messSecondaryColor,
                  ),
                  padding: EdgeInsets.symmetric(vertical: messButtonHeight),
                ),
                onPressed: () {
                  handleSubmit();
                },
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Predict".toUpperCase())),
            if (prediction.isNotEmpty)
              Text(
                'The expected footprint at the given time is: $prediction',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
