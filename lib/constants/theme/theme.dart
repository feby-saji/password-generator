import 'package:flutter/material.dart';

import '../styles/colors.dart';

class KThemeData {
  static final ThemeData darkThemeData = ThemeData(
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: KColors.backgroundColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: KColors.textColor,
      ),
      bodyMedium: TextStyle(fontSize: 16.0, color: KColors.textMedColor),
      bodySmall: TextStyle(fontSize: 14.0, color: KColors.textSmlColor),
    ),

    //
    iconTheme: IconThemeData(
      color: KColors.iconColorDark,
      size: 24.0,
    ),

    //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KColors.primaryColor,
        foregroundColor: KColors.textMedColor,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ).copyWith(
        iconColor: MaterialStateProperty.all(
            KColors.iconColorDark), // Define icon color for ElevatedButton
      ),
    ),

    //
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: KColors.primaryColor,
      foregroundColor: KColors.textMedColor,
      iconSize: 30.0, // Custom icon size for FAB
    ),

    //
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: KColors.textFieldBackgroundColor,
      prefixIconColor: KColors.iconColorLight,
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

    //
    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      tileColor: KColors.cardBck,
      textColor: KColors.listTileTextColor,
      iconColor: KColors.listTileIconColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(
        color: KColors.iconColorDark,
        size: 24.0,
      ),
    ),

    //
    dialogTheme: DialogTheme(
      backgroundColor: KColors.cardBck,
      titleTextStyle: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w400,
        color: KColors.primaryColor,
      ),
      contentTextStyle: const TextStyle(color: Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16.0),
      ),
    ),
  );

  // light theme data
  static final ThemeData lightThemeData = ThemeData(
    primaryColor: KColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        color: KColors.textColor,
      ),

      //
      bodyMedium: TextStyle(fontSize: 16.0, color: Colors.black87),
      bodySmall: TextStyle(
        fontSize: 14.0,
        color: Colors.black87,
      ),
    ),

    //
    iconTheme: IconThemeData(
      color: KColors.iconColorLight,
      size: 24.0,
    ),

    //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: KColors.primaryColor,
        foregroundColor: Colors.white, // Light text on dark button
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ).copyWith(
        iconColor: MaterialStateProperty.all(KColors.iconColorLight),
      ),
    ),

    //
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: KColors.primaryColor,
      foregroundColor: Colors.white, // Light text on dark button
      iconSize: 30.0,
    ),

    //
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: KColors.textFieldBackgroundColor,
      prefixIconColor: KColors.iconColorLight,
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

    //
    listTileTheme: ListTileThemeData(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      tileColor: KColors.cardBck,
      textColor: Colors.white,
      iconColor: KColors.listTileIconColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(color: Colors.white),
      actionsIconTheme: IconThemeData(color: Colors.white),
      iconTheme: IconThemeData(
        color: KColors.iconColorLight,
        size: 24.0,
      ),
    ),

    dialogTheme: DialogTheme(
      backgroundColor: KColors.cardBck,
      titleTextStyle: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w400,
        color: KColors.primaryColor,
      ),
      contentTextStyle: const TextStyle(color: Colors.black87),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: TextStyle(fontSize: 16.0),
      ),
    ),
  );
}


































































