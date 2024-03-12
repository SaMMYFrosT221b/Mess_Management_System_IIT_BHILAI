import 'package:flutter/material.dart';
import 'package:mess_management_system/src/features/authentication/screens/snackbar/show_snack_bar.dart';

class GeneralSnackBar extends StatelessWidget {
  const GeneralSnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    final snackBar = ShowSnackBar();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Showing Snackbar at Top'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                snackBar.showTopSnackBar(context, "This is the top snackbar");
              },
              child: const Text("Show Snackbar"),
            ),
          ],
        ),
      ),
    );
  }
}
