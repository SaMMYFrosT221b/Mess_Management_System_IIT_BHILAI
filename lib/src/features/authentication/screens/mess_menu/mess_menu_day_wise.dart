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
        "Mon": {
          "Breakfast": [
            "Poori Sabji",
            "Bread(4 Pc) Jam Butter",
            "Boiled Egg(2 Pc)",
            "Tea",
            "Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Mix Veg",
            "Arhar daal",
            "Jeera Rice",
            "Mix Salad",
            "Chapati",
            "Chicken-Curry",
            "Egg Fried Rice"
          ],
          "Snacks": [
            "Samosa",
            "Tea",
            "Coffee",
          ],
          "Dinner": [
            "Brinjal Bharta",
            "Dal Tadka",
            "Plain Rice",
            "Mixed Salad",
            "Chapatti",
            "Fish Curry",
            "Kheer/Sewai"
          ]
        },
        "Tues": {
          "Breakfast": [
            "Aloo Pyaaj Paratha",
            "Bread Jam Butter",
            "Omlette(2 Egg)",
            "Tea Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Chole Masala",
            "Kadhi Pakoda",
            "Steam Rice",
            "Mix Salad",
            "Chicken Fried Rice",
            "Egg Curry"
          ],
          "Snacks": [
            "Veg Cutlet",
            "Tea",
            "Coffee",
          ],
          "Dinner": [
            "Fry-Beans",
            "Arhar Daal",
            "Jerra Rice",
            "Mix Salad",
            "Egg Curry",
            "Chicken Curry",
            "Chicken Biryani",
            "Gulab Jamun"
          ]
        },
        "Sun": {
          "Breakfast": [
            'Gobi Parantha+Tomato Chatni',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Bhurji(2 Eggs)',
            'CORN FLAKES+MILK',
          ],
          "Lunch": [
            'Kaddu-Sabji',
            'Masoor-Dal',
            'Steam Rice',
            'Mix-Salad',
            'Chciken Curry/Biryani',
          ],
          "Snacks": [
            'Pav-Bhaji',
            'Tea+Coffee',
          ],
          "Dinner": [
            'Manchurian',
            'white veg Fried-Rice/Veg-pulao',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'EggCurry/ChickenCurry/Biryani',
            'Fruit Custard'
          ]
        },
        "Wed": {
          "Breakfast": [
            'Rawa-Dosa',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Bhurji(2-Eggs)',
            'CORN FLAKES+MILK'
          ],
          "Lunch": [
            'Bhindi-do-Pyaza',
            'Jeera Rice',
            'Mix-Salad',
            'Chilli chicken',
            'FishCurry(Rohu/Katla)'
          ],
          "Snacks": ['Papri-Chat', 'Tea+Coffee'],
          "Dinner": [
            'Veg-kofta',
            'Dal-makhni',
            'Plain Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'EggCurry/ChickenCurry/Biryani',
            'Ladoo(2 pcs)'
          ]
        },
        "Thur": {
          "Breakfast": [
            'Veg-Corn sandwich',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Omlette(2 Eggs)',
            'CORN FLAKES+MILK'
          ],
          "Lunch": [
            'Soya-Cheema',
            'Arhar Dal',
            'Steam Rice',
            'Mix-Salad',
            'Egg Curry/Chciken Chilli'
          ],
          "Snacks": [
            "Sandwich",
            "Tea/Coffee",
          ],
          "Dinner": [
            'Aloo-Jeera/Parwal',
            'Dal Tadka',
            'Jeera Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'EggCurry',
            'ChickenCurry',
            'FishCurry(Rohu/Katla)',
            'Ballusahi(2)'
          ]
        },
        "Fri": {
          "Breakfast": [
            'Dosa',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Bhurji(2 Eggs)',
            'CORN FLAKES+MILK'
          ],
          "Lunch": [
            'Loki-Kofta',
            'Rajma',
            'Jeera Rice',
            'Mix-Salad',
            'Chicken Biryani/Chicken Spicy'
          ],
          "Snacks": ['Pasta/Macaroni', 'Tea+Coffee'],
          "Dinner": [
            'Mix-veg',
            'Arhar Dal',
            'Plain Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'EggCurry/ChickenCurry/Biryani',
            'Halwa'
          ]
        },
        "Sat": {
          "Breakfast": [
            'Idli',
            'Bread(4pcs)+Jam+Butter',
            'Tea+Milk(Cofee powder)',
            'Boiled eggs(2 Eggs)',
            'CORN FLAKES+MILK'
          ],
          "Lunch": [
            'Chole',
            'Masoor-Dal',
            'Steam Rice',
            'Mix-Salad',
            'Bhature',
            'Egg Curry/FishCurry(Rohu/Katla)',
          ],
          "Snacks": [
            'Dhokla',
            'Tea+Coffee',
          ],
          "Dinner": [
            'Gobi-Matar',
            'Moong-Dal',
            'Lemon Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'EggCurry/ChickenCurry/Biryani',
            'Rasgulla'
          ]
        },
        // ... other days
      },
      "Kumar Mess": {
        "Sun": {
          "Breakfast": [
            'Aloo Paratha',
            "Bread jam",
            "Banana",
            "Tea/Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Palak Paneer",
            "Besan Gatta",
            'Masoor Daal',
            "Steam Rice",
            "Salad",
            "Chapati",
            "Curd"
          ],
          "Snacks": ["Sandwich", "Tea/Coffee"],
          "Dinner": [
            "Paneer",
            "Manchurian",
            "Fried Rice",
            "Salad",
            "Fruit Custard"
          ]
        },
        "Mon": {
          "Breakfast": [
            "Dosa",
            "Bread jam",
            "Banana",
            "Tea/Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Butter Paneer Masala",
            "Mix Veg",
            'Arhar Daal',
            "Jeera Rice",
            "Salad",
            "Chapati",
            "Curd"
          ],
          "Snacks": ["Macroni", "Tea/Coffee"],
          "Dinner": [
            "Kadai Paneer",
            "Kheer",
            "Brinjal Bharta",
            "Daal Tadka",
            "Steam Rice",
            "Salad",
            "Curd"
          ]
        },
        "Tues": {
          "Breakfast": [
            "Idli",
            "Bread jam",
            "Banana",
            "Tea/Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Matar Paneer",
            "Chole Masala",
            'Kadhi Pakoda',
            "Steam Rice",
            "Salad",
            "Chapati",
            "Curd"
          ],
          "Snacks": ["Dhokla", "Tea/Coffee"],
          "Dinner": [
            "Veg Biryani",
            "Gulab Jamun",
            "Sukhi Phaliya",
            "Arhar Daal",
            "Jeera Rice",
            "Salad",
            "Curd"
          ]
        },
        "Wed": {
          "Breakfast": [
            "Poha",
            "Bread jam",
            "Banana",
            "Tea/Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Shahi Paneer",
            "Loki Chana",
            'Masoor Daal',
            "Jeera Rice",
            "Salad",
            "Chapati",
            "Curd"
          ],
          "Snacks": ["Samosa", "Tea/Coffee"],
          "Dinner": [
            "Kadai Paneer",
            "Laddoo",
            "Veg Kofta",
            "Daal Makhni",
            "Steam Rice",
            "Salad",
            "Curd"
          ]
        },
        "Thur": {
          "Breakfast": [
            "Paneer paratha",
            "Bread jam",
            "Banana",
            "Tea/Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Palak Paneer",
            "Palak Tamatar",
            'Arhar Daal',
            "Steam Rice",
            "Salad",
            "Chapati",
            "Curd"
          ],
          "Snacks": ["Veg Roll", "Tea/Coffee"],
          "Dinner": [
            "Panner Mirch",
            "Ballu sahi",
            "Aloo Jeera",
            "Daal Tadka",
            "Jeera Rice",
            "Salad",
            "Curd"
          ]
        },
        "Fri": {
          "Breakfast": [
            "Aloo Puri",
            "Bread jam",
            "Banana",
            "Tea/Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "veg Biryani",
            "Rajma",
            'Masoor Daal',
            "Jeera Rice",
            "Salad",
            "Chapati",
            "Curd"
          ],
          "Snacks": ["Papdi Chat", "Tea/Coffee"],
          "Dinner": [
            "Shahi Paneer",
            "Halwa",
            "Mix Veg",
            "Arhar Daal",
            "Steam Rice",
            "Salad",
            "Curd"
          ]
        },
        "Sat": {
          "Breakfast": [
            "Poha",
            "Bread jam",
            "Banana",
            "Tea/Milk",
            "Corn Flakes"
          ],
          "Lunch": [
            "Chole Bhature",
            'Masoor Daal',
            "Steam Rice",
            "Salad",
            "Chapati",
            "Curd"
          ],
          "Snacks": ["Veg cutlet", "Tea/Coffee"],
          "Dinner": [
            "Butter Paneer Masala",
            "Rasgulla",
            "Gobhi Matar",
            "Moong Daal",
            "Lemon Rice",
            "Salad",
            "Curd"
          ]
        }
      },
      "Sree Sai": {
        "Sun": {
          "Breakfast": [
            'Dosa',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Bhurji(2 Eggs)',
            'CORN FLAKES+MILK',
          ],
          "Lunch": [
            'Kaddu-Sabji',
            'Masoor-Dal',
            'Steam Rice',
            'Mix-Salad',
            'Chciken Curry',
            'Biryani',
          ],
          "Snacks": [
            'Papri-Chat',
            'Tea+Cofee',
          ],
          "Dinner": [
            'Manchurian',
            'Fried-Rice/Veg-pulao',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'Fruit Custard',
            'Fish(Rohu/Katla)',
            'Biryani'
          ]
        },
        "Mon": {
          "Breakfast": [
            'Aloo-Parantha',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk',
            'Boiled egg(2 Eggs)',
            'CORN FLAKES+MILK',
          ],
          "Lunch": [
            'Mix-veg',
            'Arhar dal',
            'Jeera Rice',
            'Mix-Salad',
            'Chapati(Phulka)',
            'Chicken-Curry',
            'Fish-Curry(Rohu/Katla)',
          ],
          "Snacks": [
            'Pav-Bhaji',
            'Tea+Cofee',
          ],
          "Dinner": [
            'Brinjal-bharta',
            'Dal-Tadka',
            'Plain-Rice',
            'Mixed-Salad',
            'Kheer/Sewai',
            'EggCurry',
            'ChickenCurry',
            'Biryani'
          ]
        },
        "Tues": {
          "Breakfast": [
            'Rawa-Dosa',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk',
            'Omlette(2 Eggs)',
            'CORN FLAKES+MILK',
          ],
          "Lunch": [
            'Chole-Masala',
            'Kadhi Pakora',
            'Steam Rice',
            'Mix-Salad',
            'Chicken Fried Rich',
            'Egg Curry',
          ],
          "Snacks": [
            'Sandwich',
            'Tea+Cofee',
          ],
          "Dinner": [
            'Dry-beans',
            'Arhar Dal',
            'Jeera Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'Gulab Jamun(2 pcs)',
            'FishCurry(Rohu/Katla)',
            'Biryani'
          ]
        },
        "Wed": {
          "Breakfast": [
            'Aloo-Poori',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Bhurji(2-Eggs)',
            'CORN FLAKES+MILK',
          ],
          "Lunch": [
            'Bhindi-do-Pyaza',
            'Jeera Rice',
            'Mix-Salad',
            'Chilli chicken',
            'Fish-Curry(Rohu/Katla)',
          ],
          "Snacks": [
            'Dhokla',
            'Tea+Cofee',
          ],
          "Dinner": [
            'Veg-kofta',
            'Dal-makhni',
            'Plain Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'Ladoo(2 pcs)',
            'EggCurry',
            'Chicken Curry',
            'Chicken Biryani'
          ]
        },
        "Thur": {
          "Breakfast": [
            'Gobi-Parantha',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Omlette(2 Eggs)',
            'CORN FLAKES+MILK',
          ],
          "Lunch": [
            'Soya-Cheema',
            'Arhar Dal',
            'Steam Rice',
            'Mix-Salad',
            'Egg Curry',
            'Chciken Chilli',
          ],
          "Snacks": [
            'Samosa',
            'Tea+Cofee',
          ],
          "Dinner": [
            'Aloo-Jeera/Parwal',
            'Dal Tadka',
            'Jeera Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'Ballusahi(2)',
            'FishCurry(Rohu/Katla)',
            'Chicken Biryani'
          ]
        },
        "Fri": {
          "Breakfast": [
            'Idli',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Bhurji(2 Eggs)',
            'CORN FLAKES+MILK',
          ],
          "Lunch": [
            'Loki-Kofta',
            'Rajma',
            'Jeera Rice',
            'Mix-Salad',
            'Chicken Biryani',
            'Chicken Spicy',
          ],
          "Snacks": [
            'Veg-Cutlet',
            'Tea+Cofee',
          ],
          "Dinner": [
            'Mix-veg',
            'Arhar Dal',
            'Plain Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'Halwa',
            'EggCurry',
            'Chicken Curry',
            'Chicken Biryani'
          ]
        },
        "Sat": {
          "Breakfast": [
            'Sandwich-Veg-Corn',
            'Bread(4pcs)+Jaam+Butter',
            'Tea+Milk(Cofee powder)',
            'Boiled eggs(2 Eggs)',
            'CORN FLAKES+MILK',
          ],
          "Lunch": [
            'Chole',
            'Masoor-Dal',
            'Steam Rice',
            'Mix-Salad',
            'Bhature',
            'Egg Curry',
            'Fried Chicken',
          ],
          "Snacks": [
            'Pasta/Macaroni',
            'Tea+Cofee',
          ],
          "Dinner": [
            'Gobi-Matar',
            'Moong-Dal',
            'Lemon Rice',
            'Mixed-Salad',
            'Chapatti(fulka)',
            'Rasgulla',
            'EggCurry',
            'Chicken Curry',
            'Biryani'
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
