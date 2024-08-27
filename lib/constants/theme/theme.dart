import 'package:flutter/material.dart';

import '../styles/colors.dart';

class KThemeData {
  static final ThemeData darkThemeData = ThemeData(
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: KColors.backgroundColor,
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: KColors.textLargeColor,
      ),
      bodyMedium: TextStyle(fontSize: 16.0, color: KColors.textMedColor),
      bodySmall: TextStyle(fontSize: 14.0, color: KColors.textSmlColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KColors.primaryColor,
        foregroundColor: KColors.textMedColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: KColors.primaryColor,
      foregroundColor: KColors.textMedColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: KColors.textFieldBackgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: KColors.textFieldBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(color: KColors.textFieldFocusBorderColor),
      ),
      hintStyle: TextStyle(color: KColors.textFieldHintColor),
      labelStyle: TextStyle(color: KColors.textFieldLabelColor),
    ),
    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      tileColor: KColors.listTileBackgroundColor,
      textColor: KColors.listTileTextColor,
      iconColor: KColors.listTileIconColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
