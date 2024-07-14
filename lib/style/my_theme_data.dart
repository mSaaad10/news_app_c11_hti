import 'package:flutter/material.dart';

class MyThemeData {
  static const Color primaryColor = Color((0xFF39A552));
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(26),
                bottomLeft: Radius.circular(26))),
        centerTitle: true,
        backgroundColor: primaryColor,
        titleTextStyle: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
    colorScheme:
        ColorScheme.fromSeed(seedColor: primaryColor, primary: primaryColor),
    useMaterial3: true,
  );
}
