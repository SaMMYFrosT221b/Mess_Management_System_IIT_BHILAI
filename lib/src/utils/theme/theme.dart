import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_management_system/src/utils/theme/widget_theme.dart/elevated_button_theme.dart';
import 'package:mess_management_system/src/utils/theme/widget_theme.dart/outline_button_theme.dart';
import 'package:mess_management_system/src/utils/theme/widget_theme.dart/text_theme.dart';

class MessAppTheme {
  MessAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: MessTextTheme.lightTextTheme,
    outlinedButtonTheme: MessOutlineButtonTheme.lightOutlineButtonTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme: MessElevatedButtonTheme.lightElevatedButtonTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: MessTextTheme.darkTextTheme,
    outlinedButtonTheme: MessOutlineButtonTheme.darkOutlineButtonTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme: MessElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
