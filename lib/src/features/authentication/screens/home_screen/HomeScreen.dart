import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mess_management_system/src/common_widgets/days_heat_map/days_heat_map.dart';
import 'package:mess_management_system/src/common_widgets/drop_menu/drop_menu.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/image_strings.dart';
import 'package:mess_management_system/src/features/authentication/screens/bottom_navigation_bar/banner_with_text.dart';
import 'package:mess_management_system/src/features/authentication/screens/mess_menu/mess_menu.dart';
import 'package:mess_management_system/src/features/authentication/screens/mess_menu/mess_menu_day_wise.dart';
import 'package:mess_management_system/src/features/authentication/screens/snackbar/snack_bar.dart';
import 'package:mess_management_system/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:mess_management_system/src/test.dart';

import '../restraunt/menu_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => WelcomeScreen()));
  }

  void snackBar() {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => GeneralSnackBar()));
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    Size size = MediaQuery.of(context).size;

    //Plants category
    List<String> _plantTypes = [
      'Recommended',
      'Veg',
      'Non-Veg',
      'Sweet',
      'Drinks',
    ];

    var popular_dishes = [
      "Rajma",
      "Carrot Peas",
      "Gobi Paratha-Bhurji",
      "Panni Puri",
      "Mix Veg dry",
      "Brinjal Bartha",
      "Aloo puri-Boiled egg",
      "Dahi Kachori",
      "Choley(kabuli chana)",
      "Mix Veg",
      "Idly-Boiled egg",
      "Bread Pakoda",
      "Gatte Sabji",
      "Veg Manchurian",
      "Rawa Dosa-Bhurji",
      "Samosa",
      "Palak Tomato",
      "Aloo Sem",
      "Uttapam-Omlette",
      "Veg Cutlet",
      "Chole Masala",
      "Aloo gobhi mattr",
      "Masala Dosa-Omlette",
      "Pav Bhaji",
      "Loki Chana",
      "Veg kofta",
      "Aloo Paratha-Bhurji",
      "Veg Roll"
    ];

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    DateTime now = DateTime.now();
    DateTime dateTime = DateTime(now.year, now.month, now.day);
    String dateOnly =
        "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Home",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          Text(
            "Logout",
            style: TextStyle(fontSize: 10),
          ),
          IconButton(
              onPressed: logout,
              icon: Icon(
                Iconsax.logout,
                color: Colors.black,
                size: 30.0,
              ))
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Todays Menu"),
            Container(
              height: 600,
              width: double.infinity,
              child: Test(),
            ),
            ItemCard(
              dishImage:
                  'https://www.cubesnjuliennes.com/wp-content/uploads/2020/03/Best-Kadai-Paneer-Recipe.jpg',
              dishName: 'Paneer Bhurji',
              mess: 'Kumar',
              price: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String dishImage;
  final String dishName;
  final String mess;
  final double price;

  const ItemCard({
    Key? key,
    required this.dishImage,
    required this.dishName,
    required this.mess,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(dishImage), // display the dish image
        ),
        title: Text(dishName), // display the dish name
        subtitle: Text(mess), // display the mess
        trailing: Text('\$${price.toStringAsFixed(2)}'), // display the price
      ),
    );
  }
}

class MessDataFromBackend extends StatefulWidget {
  const MessDataFromBackend({super.key});

  @override
  State<MessDataFromBackend> createState() => _MessDataFromBackendState();
}

class _MessDataFromBackendState extends State<MessDataFromBackend> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: size.height,
      child: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection("todays_menu").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData && snapshot.data != null) {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> menu = snapshot.data!.docs[index]
                        .data() as Map<String, dynamic>;
                    String docId = snapshot.data!.docs[index].id;
                    return ExpansionTile(
                      title: Text(docId),
                      children: menu.entries.map((entry) {
                        String meal = entry.key;
                        List<dynamic> items = entry.value;
                        // return ListTile(
                        //   title: Text(meal),
                        //   subtitle: Text(items.join(', ')),
                        // );
                        return MenuCard(
                          image: messButterPaneer,
                          title: meal,
                          price: 46.90,
                          subTitle: items.join(', ').toString(),
                          messName: docId,
                        );
                      }).toList(),
                    );
                  },
                ),
              );
            } else {
              return Text("No Data");
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
