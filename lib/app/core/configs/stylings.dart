import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color gray08 = Color(0xffF1F3F5);
  static const Color gray02 = Color(0xff5E6770);

  static final ThemeData lightThemeHome = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: gray08,
    textTheme: TextTheme(
      subtitle2: TextStyle(
        fontSize: 14,
        color: gray02,
        fontWeight: FontWeight.w400
      )) 
  );
}