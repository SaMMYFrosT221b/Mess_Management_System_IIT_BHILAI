import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MessTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: Colors.black87),
    titleSmall: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 24,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(color: Colors.black87),
    titleSmall: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 24,
    ),
    displaySmall: GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 20,
    ),
  );
}
