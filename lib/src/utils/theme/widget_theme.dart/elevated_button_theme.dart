import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/sizes.dart';

class MessElevatedButtonTheme {
  MessElevatedButtonTheme._();

//   Light theme
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: messWhiteColor,
      backgroundColor: messSecondaryColor,
      side: BorderSide(
        color: messSecondaryColor,
      ),
      padding: EdgeInsets.symmetric(vertical: messButtonHeight),
    ),
  );

//   Dark theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: RoundedRectangleBorder(),
      foregroundColor: messSecondaryColor,
      backgroundColor: messWhiteColor,
      side: BorderSide(
        color: messSecondaryColor,
      ),
      padding: EdgeInsets.symmetric(vertical: messButtonHeight),
    ),
  );
}
