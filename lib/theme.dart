import 'package:flutter/material.dart';

class AppColors {
  Color darkBackground = const Color(0xff121212);
  Color darkCard = const Color(0xff1F1F1F);

  final darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    dividerColor: Colors.white30,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.white
      ),
      filled: true,
        fillColor: Color(0xff3f3e3e),)
  );

  final lightTheme = ThemeData(
    dialogBackgroundColor: Colors.deepPurple[200],
    chipTheme: ChipThemeData(
      labelStyle: TextStyle(color: Colors.white),
      backgroundColor: Colors.deepPurple[400],
      shadowColor: Colors.deepPurple[800],
    ),
    cardTheme: CardTheme(
      color: Colors.purple[800],
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple[800],
    ),
    primaryColor: Colors.deepPurple[400],
    brightness: Brightness.light,
    dividerColor: Colors.deepPurple[800],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.purple[800]!),
        /*foregroundColor: MaterialStateProperty.all<Color>(Colors.purple[800]!),
        shadowColor: MaterialStateProperty.all<Color>(Colors.purple[800]!),
        overlayColor: MaterialStateProperty.all<Color>(Colors.purple[800]!),
        surfaceTintColor: MaterialStateProperty.all<Color>(Colors.purple[800]!),*/
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
        fillColor: Colors.deepPurple[400],
        focusColor: Colors.purple[800],
        hoverColor: Colors.purple[800],
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple[800]!),
        ),
        floatingLabelStyle: TextStyle(
          color: Colors.purple[800],
        ),
        hintStyle: const TextStyle(
          fontSize: 10,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple[800]!, width: 2.0),
          borderRadius: BorderRadius.circular(5),
        ),
        activeIndicatorBorder: BorderSide(
          color: Colors.purple[800]!,
        )),
  );
}
