import 'package:flutter/material.dart';
import 'package:smarthealthcare/src/theme/light_color.dart';

class AppSnackBar {
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: ColorResources.themeRed,
        content: Text(message, style: TextStyle(color: ColorResources.white)),
      ),
    );
  }
}