import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mess_management_system/src/common_widgets/days_heat_map/days_heat_map.dart';
import 'package:mess_management_system/src/features/authentication/screens/bottom_navigation_bar/banner_with_text.dart';
import 'package:mess_management_system/src/features/authentication/screens/snackbar/snack_bar.dart';
import 'package:mess_management_system/src/features/authentication/screens/welcome/welcome_screen.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Ratnakar Gautam"),
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Iconsax.logout)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyHeatMap(),
              SizedBox(
                height: 5.0,
              ),
              Text("Today Menu"),
              SizedBox(
                height: 5.0,
              ),
              MyCarousel(),
            ],
          ),
        ),
      ),
    );
  }
}
