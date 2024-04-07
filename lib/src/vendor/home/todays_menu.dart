import 'package:flutter/material.dart';
import 'package:mess_management_system/src/test.dart';

class VendorTodaysMenu extends StatefulWidget {
  const VendorTodaysMenu({super.key});

  @override
  State<VendorTodaysMenu> createState() => _VendorTodaysMenuState();
}

class _VendorTodaysMenuState extends State<VendorTodaysMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todays Menu"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 600,
              width: double.infinity,
              child: Test(),
            )
          ],
        ),
      ),
    );
  }
}
