import 'package:flutter/material.dart';

class ShowSnackBar {
  void showTopSnackBar(
    BuildContext context,
    String message, {
    Duration? duration,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.up,
        duration: duration ?? const Duration(milliseconds: 1000),
        backgroundColor: Colors.grey,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 10,
          right: 10,
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
