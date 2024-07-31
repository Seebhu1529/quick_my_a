import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static Color backgroundColor = const Color(0xFFFFFFFF);
  static Color primaryColor = const Color(0xFF53AE71);
  static Color widgetColor = const Color(0xFFEAEAEA);
  static Color textColor = const Color(0xFF111111);
  static Color subTextColor = const Color(0x9B111111);
  static Color errorColor = const Color(0xFFEB5757);
  static Color successColor = const Color(0xFF57EB9E);

  static double borderRadius = 10.0;

  static ThemeData buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);
    return baseTheme.copyWith(
        textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: backgroundColor);
  }
}
