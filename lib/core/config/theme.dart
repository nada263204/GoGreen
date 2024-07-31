import 'package:flutter/material.dart';

class AppTheme {
  static Color scaffoldLight = const Color(0xffF9F9F9);
  static Color scaffoldDark = const Color(0xff131313);
  static Color primary = const Color(0xffCBE8CC);
  static Color primaryLight = const Color(0xFFA5D6A7);
  static Color black = const Color(0XFF242424);
  static Color white = const Color(0XFFF9F9F9);
  static Color grey = const Color(0xFF7A7979);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldLight,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryLight,
      surfaceTint: Colors.transparent,
    ),
    primaryColor: primaryLight,
    inputDecorationTheme: const InputDecorationTheme(),
    fontFamily: 'Inter',
    appBarTheme: AppBarTheme(
      backgroundColor: scaffoldLight,
      surfaceTintColor: Colors.transparent,
      foregroundColor: black,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        color: black,
        fontSize: 23,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: black,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: scaffoldDark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryLight,
      surfaceTint: Colors.transparent,
    ),
    primaryColor: primaryLight,
    inputDecorationTheme: const InputDecorationTheme(),
    fontFamily: 'Inter',
    appBarTheme: AppBarTheme(
      backgroundColor: scaffoldDark,
      foregroundColor: white,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        color: white,
        fontSize: 23,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: white,
      ),
    ),
  );
}
