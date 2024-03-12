import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/src/common_widgets/days_heat_map/days_heat_map.dart';
import 'package:mess_management_system/src/common_widgets/future_builder/future_builder.dart';
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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => MyHeatMap()));
                },
                child: Text("SnackBar"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => FutureBuilderLoading()));
                },
                child: Text("Future Loading")),
          ],
        ),
      ),
    );
  }
}
