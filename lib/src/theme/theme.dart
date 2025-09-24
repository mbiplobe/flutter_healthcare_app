import 'package:flutter/material.dart';
import 'package:smarthealthcare/src/theme/light_color.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: ThemeData.light().colorScheme.copyWith(
    primary: ColorResources.purple,
    surface: ColorResources.background, // for cards, sheets
    onPrimary: ColorResources.iconColor, // text/icons on primary color
    secondary: ColorResources.grey,
  ),
  cardTheme: CardThemeData(
    color: ColorResources.background,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  iconTheme: IconThemeData(color: ColorResources.iconColor),
  dividerTheme: DividerThemeData(
    color: ColorResources.grey,
    thickness: 1,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: ColorResources.background,
  ),
);


  static TextStyle titleStyle =
      const TextStyle(color: ColorResources.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: ColorResources.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
