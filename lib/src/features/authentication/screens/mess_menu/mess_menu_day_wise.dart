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
                MenuList(
                    messName: messName, mealType: mealType, mealTime: 'Dinner'),
                MenuList(
                    messName: messName, mealType: mealType, mealTime: 'Dinner'),
                MenuList(
                    messName: messName, mealType: mealType, mealTime: 'Dinner')
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
      'Item 3',
    ]; // Placeholder for menu items

    return ListView.builder(
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        return MenuCard(
          image: messButterPaneer,
          title: 'Butter Paneer',
          price: 49.90,
          subTitle: 'Very Tasty',
          messName: 'kumar_mess',
        );
      },
    );
  }
}
