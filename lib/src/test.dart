import 'package:flutter/material.dart';
import 'package:mess_management_system/main.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/features/authentication/screens/mess_menu/mess_menu.dart';
import 'package:mess_management_system/src/features/authentication/screens/restraunt/menu_card.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);

  final List<String> messes = ['Kumar', 'Galav', 'Sree Sai'];
  final List<String> meals = ['Breakfast', 'Lunch', 'Snacks', 'Dinner'];

  var items = {
    "Kumar": {
      "Breakfast": ["Poha", "Omlete"],
      "Lunch": ["Poha", "Omlete"],
      "Snacks": ["Poha", "Omlete"],
      "Dinner": ["Poha", "Omlete"],
    },
    "Galav": {
      "Breakfast": ["Chicken", "Omlete"],
      "Lunch": ["Chicken", "Omlete"],
      "Snacks": ["Chicken", "Omlete"],
      "Dinner": ["Chicken", "Omlete"],
    },
    "Sree Sai": {
      "Breakfast": ["Dosa", "Omlete"],
      "Lunch": ["Dosa", "Omlete"],
      "Snacks": ["Dosa", "Omlete"],
      "Dinner": ["Dosa", "Omlete"],
    }
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: messes.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0), // change the height here
          child: AppBar(
            bottom: TabBar(
              labelStyle: TextStyle(fontSize: 25),
              unselectedLabelStyle: TextStyle(fontSize: 18),
              tabs: messes.map((mess) => Tab(text: mess)).toList(),
            ),
          ),
        ),
        body: TabBarView(
          children: messes.map((mess) {
            return DefaultTabController(
              length: meals.length,
              child: Column(
                children: [
                  TabBar(
                    labelStyle: TextStyle(fontSize: 18),
                    unselectedLabelStyle: TextStyle(fontSize: 14),
                    tabs: meals.map((meal) => Tab(text: meal)).toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: meals.map((meal) {
                        return ListView.builder(
                          itemCount: items[mess]?[meal]?.length ?? 0,
                          itemBuilder: (context, index) {
                            var mealItems = items[mess]?[meal];
                            if (mealItems != null && index < mealItems.length) {
                              // return ListTile(
                              //   title: Text(mealItems[index]),
                              // );
                              return (MenuCard(
                                  image: messButterPaneer,
                                  title: mealItems[index],
                                  price: 46.90,
                                  subTitle: "Very Tasty",
                                  messName: mess));
                            } else {
                              return ListTile(
                                title: Text('No item found'),
                              );
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
