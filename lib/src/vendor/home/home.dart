import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_management_system/src/features/authentication/screens/shops/shop_list.dart';

import '../../features/authentication/screens/welcome/welcome_screen.dart';

class VendorHomePage extends StatelessWidget {
  const VendorHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() async {
      await FirebaseAuth.instance.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
          context, CupertinoPageRoute(builder: (context) => WelcomeScreen()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Vendor-Home"),
      ),
      body: Center(
        child: Column(
          children: [Text("Home Page"), LineChartSample2(), LineChartSample()],
        ),
      ),
    );
  }
}
