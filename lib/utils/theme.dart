import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme(String lang) {
    return ThemeData.light().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 16,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: primaryColor,
          elevation: 100,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryLightColor),
      // textTheme: TextTheme(
      //   titleLarge: TextStyle(
      //     fontSize: (27).sp,
      //     height: 1.1,
      //     color: Colors.black,
      //     fontFamily:
      //     lang ==
      //                 'ar'
      //             ? 'Cairo'
      //             : 'SF',
      //   ),
      //   headlineSmall: TextStyle(
      //     fontSize: (24).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //   ),
      //   headlineMedium: TextStyle(
      //     fontSize: (22).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //   ),
      //   displaySmall: TextStyle(
      //     fontSize: (20).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //   ),
      //   displayMedium: TextStyle(
      //     fontSize: (18).sp,
      //     height: 1.1,
      //     color: const Color(0xffEC2424),
      //   ),
      //   displayLarge: TextStyle(
      //     fontSize: (17).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //   ),
      //   bodyLarge: TextStyle(
      //     fontSize: (16).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //   ),
      //   bodyMedium: TextStyle(
      //     fontSize: (15).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //   ),
      //   titleMedium: TextStyle(
      //     fontSize: (14).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //   ),
      //   titleSmall: TextStyle(
      //     fontSize: (13).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //   ),
      //   bodySmall: TextStyle(
      //     fontSize: (12).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //     fontWeight: FontWeight.w300,
      //     decoration: TextDecoration.none,
      //   ),
      //   labelLarge: TextStyle(
      //     fontSize: (11).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //     fontWeight: FontWeight.w300,
      //     decoration: TextDecoration.none,
      //   ),
      //   labelSmall: TextStyle(
      //     fontSize: (10).sp,
      //     color: Colors.black,
      //     height: 1.1,
      //     fontWeight: FontWeight.w300,
      //     decoration: TextDecoration.none,
      //   ),
      // ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black26,
      appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 16,
          iconTheme: IconThemeData(color: Colors.white70),
          backgroundColor: Colors.black,
          elevation: 100,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          )),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }
}
