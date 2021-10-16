import 'package:flutter/material.dart';

class ConstantColor {
  static Map<int, Color> color = {
    50: Color(0xFFC8161D),
    100: Color(0xFFC8161D),
    200: Color(0xFFC8161D),
    300: Color(0xFFC8161D),
    400: Color(0xFFC8161D),
    500: Color(0xFFC8161D),
    600: Color(0xFFC8161D),
    700: Color(0xFFC8161D),
    800: Color(0xFFC8161D),
    900: Color(0xFFC8161D),
  };

  static MaterialColor materialPrimaryColor = MaterialColor(0xFFff003e, color);

  static Color primaryColor = Color(0xFFC8161D);
  static Color secondaryColor = Color(0xFF2c2727);
  static Color success = Color(0xFF4BB543);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color grey = Color(0xFF667C8A);
  static Color transparent = Colors.transparent;
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
