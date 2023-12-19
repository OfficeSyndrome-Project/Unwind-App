import 'package:flutter/material.dart';

//import theme to other file
final ThemeData appTheme = _appTheme();
//define base theme
ThemeData _appTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: const Color(0xff3b67cd),
      onPrimary: const Color(0xFFF5F5FA),
      secondary: const Color(0xFF89a4e1),
      onSecondary: const Color(0xFFF5F5FA),
      background: const Color(0xFFF5F5FA),
      onBackground: Colors.black,
    ),
    textTheme: _textTheme(base.textTheme),
    elevatedButtonTheme: _buttonThemeData(base.elevatedButtonTheme),
  );
}

//define tex theme
TextTheme _textTheme(TextTheme base) => base.copyWith(
    displayLarge: base.displayLarge!.copyWith(
      fontFamily: "Noto Sans Thai",
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF3b67cd),
    ),
    displayMedium: base.displayMedium!.copyWith(
      //text in appbar
      fontFamily: "Noto Sans Thai",
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFebedf0),
    ),
    displaySmall: base.displaySmall!.copyWith(
      //time text in widget list
      fontFamily: "Noto Sans Thai",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF3B67CD),
    ),
    headlineMedium: base.headlineMedium!.copyWith(
      //text in btn
      fontFamily: "Noto Sans Thai",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF3b67cd),
    ),
    headlineSmall: base.headlineSmall!.copyWith(
      //text in btn backgroud blue
      fontFamily: "Noto Sans Thai",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xFFFFFFFF),
    ),
    titleLarge: base.titleLarge!.copyWith(
      //headtext in info
      fontFamily: "Noto Sans Thai",
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF484D56),
    ),
    titleMedium: base.titleMedium!.copyWith(
      //title widget
      fontFamily: "Noto Sans Thai",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF484D56),
    ),
    titleSmall: base.titleSmall!.copyWith(
      //semitext in info
      fontFamily: "Noto Sans Thai",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF636A75),
    ),
    bodyLarge: base.bodyLarge!.copyWith(
      //text in widget list
      fontFamily: "Noto Sans Thai",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF484D56),
    ),
    bodyMedium: base.bodyMedium!.copyWith(
      //semitext in widget list
      fontFamily: "Noto Sans Thai",
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF636A75),
    ),
    bodySmall: base.bodySmall!.copyWith(
      //head main topic in workout list
      fontFamily: "Noto Sans Thai",
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: const Color(0xFF3B67CD),
    ),
    labelMedium: base.labelMedium!.copyWith(
      fontFamily: "Noto Sans Thai",
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF3B67CD),
    ));

//define btn theme
ElevatedButtonThemeData _buttonThemeData(ElevatedButtonThemeData base) =>
    ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF3B67CD),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white)),
    );
