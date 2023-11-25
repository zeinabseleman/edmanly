import 'package:flutter/material.dart';
 import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Droid Arabic Kufi',
      primaryColor: primaryColor,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith();
  }
}
