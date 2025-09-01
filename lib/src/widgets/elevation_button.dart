import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/core/height_constants.dart';

class ElevationbuttonWidget extends StatefulWidget {
  final String title;
  final VoidCallback onPress;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double elevation;
  final IconData? icon;

  const ElevationbuttonWidget({
    super.key,
    required this.title,
    required this.onPress,
    required this.color,
    required this.textColor,
    required this.borderRadius,
    required this.elevation,
    this.icon,
  });

  @override
  State<ElevationbuttonWidget> createState() =>
      __ElevationbuttonWidgetStateState();
}

class __ElevationbuttonWidgetStateState extends State<ElevationbuttonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppHeightConstants.height15),
      child: ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          foregroundColor: widget.textColor,
          elevation: widget.elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppHeightConstants.height20,
            horizontal: AppHeightConstants.height30,
          ),
        ),
        child: widget.icon != null
            ? Row(
              mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(widget.icon, color: widget.textColor),
                  SizedBox(width: AppHeightConstants.height10),
                  Text(widget.title, style: TextStyle(color: widget.textColor,fontWeight: FontWeight.bold)),
                ],
              )
            : Text(widget.title, style: TextStyle(color: widget.textColor,fontWeight: FontWeight.bold)),
      ),
    );
  }
}
