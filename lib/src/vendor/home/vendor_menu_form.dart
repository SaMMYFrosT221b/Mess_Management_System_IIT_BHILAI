import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../constants/text_string.dart';

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MealForm(),
    );
  }
}

class MealForm extends StatefulWidget {
  @override
  _MealFormState createState() => _MealFormState();
}

class _MealFormState extends State<MealForm> {
  Map<String, List<String>> meals = {
    'Breakfast': [],
    'Lunch': [],
    'Snacks': [],
    'Dinner': [],
  };

  var messName = "Kumar";

  void sendData() async {
    var url =
        'https://service-suitable-apache-donation.trycloudflare.com/create';
    var messName = 'kumar_mess'; // replace with your actual mess name

    var data = {
      'meals': meals,
      'messName': messName,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print('Failed to send data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Form'),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView(
            shrinkWrap: true,
            children: meals.entries.map((entry) {
              return ExpansionTile(
                title: Text(entry.key),
                children: entry.value.map((meal) {
                  return ListTile(
                    title: Text(meal),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          entry.value.remove(meal);
                        });
                      },
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          ),
          OutlinedButton(
            onPressed: () {
              sendData();
            },
            child: Text('Submit'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Iconsax.add_copy),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              String mealType = meals.keys.first; // Default value
              String mealName = "";

              return StatefulBuilder(
                builder: (BuildContext context, StateSetter modalSetState) {
                  return Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text('Add a meal',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        DropdownButton<String>(
                          value: mealType,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              modalSetState(() {
                                mealType = newValue;
                              });
                            }
                          },
                          items: meals.keys
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.emoji_food_beverage),
                            labelText: "Add Dish Here",
                            hintText: "Add Dish Here",
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            mealName = value;
                          },
                        ),
                        SizedBox(height: 10),
                        OutlinedButton(
                          child: Text('Add'),
                          onPressed: () {
                            if (mealType != null && mealName != null) {
                              setState(() {
                                // Use the setState of _MealFormState
                                meals[mealType]?.add(mealName);
                              });
                            }
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
