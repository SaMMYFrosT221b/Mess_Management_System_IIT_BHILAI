import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
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
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Iconsax.logout),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Breakfast",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              LineChartSample2(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Lunch",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              LineChartSample(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Snacks",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              LineChartSample3(),
              SizedBox(
                height: 20,
              ),
              Text(
                "Dinner",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              LineChartSample3()
            ],
          ),
        ),
      ),
    );
  }
}

class LineChartSample3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, 3),
                FlSpot(2, 2),
                FlSpot(3, 5),
                FlSpot(4, 3.5),
                FlSpot(5, 4.5),
                FlSpot(6, 3.5),
                FlSpot(7, 5),
                FlSpot(8, 4),
                FlSpot(9, 6),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
            ),
            LineChartBarData(
              spots: [
                FlSpot(0, 2),
                FlSpot(1, 4),
                FlSpot(2, 3),
                FlSpot(3, 6),
                FlSpot(4, 4.5),
                FlSpot(5, 5.5),
                FlSpot(6, 4.5),
                FlSpot(7, 6),
                FlSpot(8, 5),
                FlSpot(9, 7),
              ],
              isCurved: true,
              color: Colors.red,
              barWidth: 2,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
