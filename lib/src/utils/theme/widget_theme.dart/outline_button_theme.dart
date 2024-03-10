import 'package:flutter/material.dart';
import 'package:mess_management_system/src/constants/colors.dart';
import 'package:mess_management_system/src/constants/sizes.dart';

class MessOutlineButtonTheme {
  MessOutlineButtonTheme._();

//   Light theme
  static final lightOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: messSecondaryColor,
      side: BorderSide(
        color: messSecondaryColor,
      ),
      padding: EdgeInsets.symmetric(vertical: messButtonHeight),
    ),
  );

//   Dark theme
  static final darkOutlineButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: messWhiteColor,
      side: BorderSide(
        color: messWhiteColor,
      ),
      padding: EdgeInsets.symmetric(vertical: messButtonHeight),
    ),
  );
}
