import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  //* Dark Color Theme (Mixture of Purple an some Jet Gray)
  static const Color _darkPrimaryColor = Color(0xFF433E3F);
  static const Color _darkOnPrimaryColor = Color(0xFF3A1540);
  static const Color _darkSecondaryColor = Color(0xFF312B30);
  static const Color _darkAppBarColor = Color(0xFF370740);
  static const Color _darkTextColor = Colors.white;

  //* Light Color Theme (Mixture of Blue an light Gray)
  static const Color _lightPrimaryColor = Color(0xFFCAD8E0);
  static const Color _lightOnPrimaryColor = Color(0xFF8FB0BF);
  static const Color _lightSecondaryColor = Color(0xFFADC4D0);
  static const Color _lightAppBarColor = Color(0xFF69777F);
  static const Color _lightTextColor = Colors.black;

  //* Some additional Colors for extra Things
  static const Color _iconColor = Colors.white;
  static const Color _lightCustomButtonColorTop = Color.fromARGB(255, 248, 252, 255);
  static const Color _darkCustomButtonColorTop = Color.fromARGB(255, 96, 95, 95);
  static const Color _lightCustomButtonColorBottom = Color.fromRGBO(158, 158, 158, 1);
  static const Color _darkCustomButtonColorBottom = Color.fromARGB(255, 31, 31, 31);

  //! Styles und Themes (vom Text) ggf. zusammenfassen sofern mehrere größen benötigt werden !
  //* Text Styles (dark and light styles are the same except the color)
  static final _lightHeadingText = GoogleFonts.cinzel(
      textStyle: const TextStyle(
          color: _lightTextColor, fontSize: 20, fontWeight: FontWeight.bold));
  static final _lightBodyText = GoogleFonts.cinzel(
      textStyle: const TextStyle(color: _lightTextColor, fontSize: 16));

  static final _darkHeadingText = GoogleFonts.cinzel(
      textStyle: const TextStyle(
          color: _darkTextColor, fontSize: 20, fontWeight: FontWeight.bold));
  static final _darkBodyText = GoogleFonts.cinzel(
      textStyle: const TextStyle(
          color: _darkTextColor, fontSize: 16, fontWeight: FontWeight.bold));

  //* TextThemes (dark and light themes are the same except the color)
  static final TextTheme _lightTextTheme =
      TextTheme(displayLarge: _lightHeadingText, bodyLarge: _lightBodyText);

  static final TextTheme _darkTextTheme =
      TextTheme(displayLarge: _darkHeadingText, bodyLarge: _darkBodyText);

  //* Defining the Themes
  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: _lightPrimaryColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: _lightAppBarColor,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: _lightAppBarColor),
      colorScheme: const ColorScheme.light(
        primary: _lightPrimaryColor,
        onPrimary: _lightOnPrimaryColor,
        secondary: _lightSecondaryColor,
        onSurface: _lightCustomButtonColorTop,
        surface: _lightCustomButtonColorBottom,
      ),
      textTheme: _lightTextTheme);

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryColor,
      appBarTheme: const AppBarTheme(
          backgroundColor: _darkAppBarColor,
          iconTheme: IconThemeData(color: _iconColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: _darkAppBarColor),
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimaryColor,
        onPrimary: _darkOnPrimaryColor,
        secondary: _darkSecondaryColor,
        onSurface: _darkCustomButtonColorTop,
        surface: _darkCustomButtonColorBottom,
      ),
      textTheme: _darkTextTheme);
}
