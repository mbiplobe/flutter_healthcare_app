import 'package:flutter/material.dart';

class ColorResources {
  // Background & Surfaces
  static const Color background = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF20262C);
  static const Color lightBlack = Color(0xFF5F5F60);

  // Text Colors
  static const Color titleTextColor = Color(0xFF1B1718);
  static const Color subTitleTextColor = Color(0xFFB9BFCD);

  // Primary Brand Colors
  static const Color purple = Color(0xFF8873F4);
  static const Color purpleLight = Color(0xFF9489F4);
  static const Color purpleExtraLight = Color(0xFFB1A5F6);

  static const Color skyBlue = Color(0xFF71B4FB);
  static const Color lightBlue = Color(0xFF7FBCFB);
  static const Color extraLightBlue = Color(0xFFD9EEFF);

  static const Color orange = Color(0xFFFA8C73);
  static const Color lightOrange = Color(0xFFFA9881);

  static const Color green = Color(0xFF4CD1BC);
  static const Color lightGreen = Color(0xFF5ED6C3);

  // Neutral / Utility
  static const Color grey = Color(0xFFB8BFCE);
  static const Color iconColor = Color(0xFFCBD0DB);

  // Accent / Theme
  static const Color themeRed = Color(0xFF8BC73C);

  // Material Swatch Example (White)
  static const Map<int, Color> _colorMap = {
    50: Color(0x10FFFFFF),
    100: Color(0x20FFFFFF),
    200: Color(0x30FFFFFF),
    300: Color(0x40FFFFFF),
    400: Color(0x50FFFFFF),
    500: Color(0x60FFFFFF),
    600: Color(0x70FFFFFF),
    700: Color(0x80FFFFFF),
    800: Color(0x90FFFFFF),
    900: Color(0xFFFFFFFF),
  };

  static const MaterialColor materialWhite = MaterialColor(0xFFFFFFFF, _colorMap);
}
