import 'package:flutter/material.dart';
import 'package:mess_management_system/src/common_widgets/drop_menu/drop_menu.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/features/authentication/screens/restraunt/menu_card.dart';

class MessMenuScreen extends StatefulWidget {
  @override
  _MessMenuScreenState createState() => _MessMenuScreenState();
}

class _MessMenuScreenState extends State<MessMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                image: AssetImage(messJuiceCorner),
                height: 90,
              ), // Adjust the path and height as needed
              // Text('Mess Menu'),
            ],
          ),
          bottom: const TabBar(
            labelStyle: TextStyle(fontSize: 16),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            tabs: [
              Tab(text: 'Kumar Mess'),
              Tab(text: 'Galav Mess'),
              Tab(text: 'Sree Sai'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MealMenu(messName: 'Kumar Mess', mealType: 'Veg'),
            MealMenu(messName: 'Galav Mess', mealType: 'Non-veg'),
            MealMenu(messName: 'Sree Sai', mealType: 'Non-veg'),
          ],
        ),
      ),
    );
  }
}

class MealMenu extends StatelessWidget {
  final String messName;
  final String mealType;

  MealMenu({required this.messName, required this.mealType});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          const TabBar(
            labelColor: Colors.black,
            labelStyle:
                TextStyle(fontSize: 16), // Set your desired font size here
            unselectedLabelStyle: TextStyle(fontSize: 16),
            tabs: [
              Tab(
                text: 'Breakfast',
              ),
              Tab(text: 'Lunch'),
              Tab(text: 'Snacks'),
              Tab(text: 'Dinner'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                MenuList(
                    messName: messName,
                    mealType: mealType,
                    mealTime: 'Breakfast'),
                MenuList(
                    messName: messName, mealType: mealType, mealTime: 'Lunch'),
                MenuList(
                    messName: messName, mealType: mealType, mealTime: 'Snacks'),
                MenuList(
                    messName: messName, mealType: mealType, mealTime: 'Dinner'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final String messName;
  final String mealType;
  final String mealTime;

  MenuList(
      {required this.messName, required this.mealType, required this.mealTime});

  @override
  Widget build(BuildContext context) {
    // You would fetch the actual menu data from a database or service
    final List<String> menuItems = [
      'Item 1',
      'Item 2',
      'Item 3'
    ]; // Placeholder for menu items

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return const MenuCard(
            image: messButterPaneer, title: "Butter Paneer", price: 49.90);
      },
    );
  }
}
