import 'package:flutter/material.dart';
import 'package:mess_management_system/src/common_widgets/drop_menu/drop_menu.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/features/authentication/screens/restraunt/menu_card.dart';

// class MessMenuScreenDayWise extends StatefulWidget {
//   @override
//   _MessMenuScreenState createState() => _MessMenuScreenState();
// }
//
// class _MessMenuScreenState extends State<MessMenuScreenDayWise> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 7,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Image(
//                 image: AssetImage(messJuiceCorner),
//                 height: 60,
//               ), // Adjust the path and height as needed
//               Text('Mess Menu'),
//             ],
//           ),
//           bottom: const TabBar(
//             labelStyle: TextStyle(fontSize: 16),
//             unselectedLabelStyle: TextStyle(fontSize: 16),
//             tabs: [
//               Tab(text: 'Kumar Mess'),
//               Tab(text: 'Galav Mess'),
//               Tab(text: 'Sree Sai'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             MealMenu(messName: 'Kumar Mess', mealType: 'Veg'),
//             MealMenu(messName: 'Galav Mess', mealType: 'Non-veg'),
//             MealMenu(messName: 'Sree Sai', mealType: 'Non-veg'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MealMenu extends StatelessWidget {
//   final String messName;
//   final String mealType;
//
//   MealMenu({required this.messName, required this.mealType});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 7,
//       child: Column(
//         children: <Widget>[
//           const TabBar(
//             labelColor: Colors.black,
//             labelStyle:
//                 TextStyle(fontSize: 16), // Set your desired font size here
//             unselectedLabelStyle: TextStyle(fontSize: 16),
//             tabs: [
//               Tab(
//                 text: 'Sun',
//               ),
//               Tab(text: 'Mon'),
//               Tab(text: 'Tues'),
//               Tab(text: 'Wed'),
//               Tab(text: 'Thur'),
//               Tab(text: 'Fri'),
//               Tab(text: 'Sat'),
//             ],
//           ),
//           Expanded(
//             child: TabBarView(
//               children: [
//                 MenuList(
//                     messName: messName,
//                     mealType: mealType,
//                     mealTime: 'Breakfast'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Lunch'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Snacks'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Dinner'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Dinner'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Dinner'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Dinner'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MenuList extends StatelessWidget {
//   final String messName;
//   final String mealType;
//   final String mealTime;
//
//   MenuList(
//       {required this.messName, required this.mealType, required this.mealTime});
//
//   @override
//   Widget build(BuildContext context) {
//     // You would fetch the actual menu data from a database or service
//     final List<String> menuItems = [
//       'Item 1',
//       'Item 2',
//       'Item 3'
//     ]; // Placeholder for menu items
//
//     return ListView.builder(
//       itemCount: menuItems.length,
//       itemBuilder: (context, index) {
//         return const MenuCard(
//             image: messButterPaneer, title: "Butter Paneer", price: 49.90);
//       },
//     );
//   }
// }

class MessMenuScreenDayWise extends StatefulWidget {
  @override
  _MessMenuScreenState createState() => _MessMenuScreenState();
}

class _MessMenuScreenState extends State<MessMenuScreenDayWise> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Corrected length to match the number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage(messJuiceCorner),
                height: 60,
              ),
              Text('Mess Menu'),
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
            MealMenu(messName: 'Sree Sai', mealType: 'Non-veg')
          ],
        ),
      ),
    );
  }
}

// class MealMenu extends StatelessWidget {
//   final String messName;
//   final String mealType;
//
//   MealMenu({required this.messName, required this.mealType});
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 7,
//       child: Column(
//         children: <Widget>[
//           const TabBar(
//             labelColor: Colors.black,
//             labelStyle: TextStyle(fontSize: 16),
//             unselectedLabelStyle: TextStyle(fontSize: 16),
//             tabs: [
//               Tab(text: 'Sun'),
//               Tab(text: 'Mon'),
//               Tab(text: 'Tues'),
//               Tab(text: 'Wed'),
//               Tab(text: 'Thur'),
//               Tab(text: 'Fri'),
//               Tab(text: 'Sat'),
//             ],
//           ),
//           Expanded(
//             child: TabBarView(
//               children: [
//                 MenuList(
//                     messName: messName,
//                     mealType: mealType,
//                     mealTime: 'Breakfast'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Lunch'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Snacks'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Dinner'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Dinner'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Dinner'),
//                 MenuList(
//                     messName: messName, mealType: mealType, mealTime: 'Dinner')
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class MealMenu extends StatelessWidget {
  final String messName;
  final String mealType;

  MealMenu({required this.messName, required this.mealType});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Column(
        children: <Widget>[
          const TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 16),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            tabs: [
              Tab(text: 'Sun'),
              Tab(text: 'Mon'),
              Tab(text: 'Tues'),
              Tab(text: 'Wed'),
              Tab(text: 'Thur'),
              Tab(text: 'Fri'),
              Tab(text: 'Sat'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                DayMenu(messName: messName, mealType: mealType, day: 'Sun'),
                DayMenu(messName: messName, mealType: mealType, day: 'Mon'),
                DayMenu(messName: messName, mealType: mealType, day: 'Tues'),
                DayMenu(messName: messName, mealType: mealType, day: 'Wed'),
                DayMenu(messName: messName, mealType: mealType, day: 'Thur'),
                DayMenu(messName: messName, mealType: mealType, day: 'Fri'),
                DayMenu(messName: messName, mealType: mealType, day: 'Sat')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DayMenu extends StatelessWidget {
  final String messName;
  final String mealType;
  final String day;

  DayMenu({required this.messName, required this.mealType, required this.day});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: <Widget>[
          const TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 16),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            tabs: [
              Tab(text: 'Breakfast'),
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
                  mealTime: 'Breakfast',
                  day: day,
                ),
                MenuList(
                  messName: messName,
                  mealTime: 'Lunch',
                  day: day,
                ),
                MenuList(
                  messName: messName,
                  mealTime: 'Snacks',
                  day: day,
                ),
                MenuList(
                  messName: messName,
                  mealTime: 'Dinner',
                  day: day,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class MenuList extends StatelessWidget {
//   final String messName;
//   final String mealType;
//   final String mealTime;
//
//   MenuList(
//       {required this.messName, required this.mealType, required this.mealTime});
//
//   @override
//   Widget build(BuildContext context) {
//     // You would fetch the actual menu data from a database or service
//
//     final List<String> menuItems = [
//       'Item 1',
//       'Item 2',
//       'Item 3',
//       'Item 4'
//     ]; // Placeholder for menu items
//
//     return ListView.builder(
//       itemCount: menuItems.length,
//       itemBuilder: (context, index) {
//         return MenuCard(
//           image: messButterPaneer,
//           title: 'Butter Paneer',
//           price: 49.90,
//           subTitle: 'Very Tasty',
//           messName: 'kumar_mess',
//         );
//       },
//     );
//   }
// }

class MenuList extends StatelessWidget {
  final String messName;
  final String day;
  final String mealTime;

  MenuList({required this.messName, required this.day, required this.mealTime});

  @override
  Widget build(BuildContext context) {
    Map<String, Map<String, Map<String, List<String>>>> menuData = {
      "Galav Mess": {
        "Sun": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Chicken Curry",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Mon": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Tues": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Wed": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Thur": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Fri": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Sat": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        // ... other days
      },
      "Kumar Mess": {
        "Sun": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Chili Paneer",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Samosa",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Mon": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Tues": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Wed": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Thur": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Fri": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Sat": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        // ... other days
      },
      "Sree Sai": {
        "Sun": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Mon": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Tues": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Wed": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Thur": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Fri": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        "Sat": {
          "Breakfast": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Snacks": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Dinner": [
            "Poori Sabji",
            "Bread Jam Butter",
            "Boiled Egg",
            "Tea Milk",
            "Corn Flakes"
          ]
        },
        // ... other days
      }
    };

    // Get the menu items for the current mess, day, and meal time
    List<String> menuItems = menuData[messName]?[day]?[mealTime] ?? [];

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return MenuCard(
          image:
              messButterPaneer, // You would fetch the actual image from a database or service
          title: menuItems[index],
          price:
              49.90, // You would fetch the actual price from a database or service
          subTitle:
              'Very Tasty', // You would fetch the actual subtitle from a database or service
          messName: messName,
        );
      },
    );
  }
}
