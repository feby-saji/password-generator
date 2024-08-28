import 'package:flutter/material.dart';

class HelperFunc {
  static late double _width;
  static late double _height;
  static init(context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.width;
  }

  static pushScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static verticalSizedBox(BuildContext context, {double height = 0.05}) {
    return SizedBox(height: _height * height);
  }

  static horizontalSizedBox(BuildContext context, {double width = 0.05}) {
    return SizedBox(height: _width * width);
  }

  static isDarkTheme(BuildContext context) {
    Brightness brightness = Theme.of(context).brightness;

    if (brightness == Brightness.dark) {
      return true;
    } else {
      return false;
    }
  }
}
