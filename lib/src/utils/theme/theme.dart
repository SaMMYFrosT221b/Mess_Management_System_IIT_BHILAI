import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_management_system/src/utils/theme/widget_theme.dart/text_theme.dart';

class MessAppTheme {
  MessAppTheme._();

  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: MessTextTheme.lightTextTheme,
      appBarTheme: AppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: MessTextTheme.darkTextTheme,
      appBarTheme: AppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: ElevatedButton.styleFrom()));
}
