import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/core/height_constants.dart';

class FlatButtonWidget extends StatefulWidget {
  final String title;
  final String btnTitle;
  final VoidCallback onPress;
  final Color textColor;

  const FlatButtonWidget({
    super.key,
    required this.title,
    required this.btnTitle,
    required this.onPress,
    required this.textColor
  });

  @override
  State<FlatButtonWidget> createState() =>
      __FlatButtonWidgetStateState();
}

class __FlatButtonWidgetStateState extends State<FlatButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppHeightConstants.height15),
      child: Row(
        children: [
          Text( widget.title,
              style: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.normal,
              )),
          TextButton(
            onPressed: widget.onPress,
            style: ElevatedButton.styleFrom(
              foregroundColor: widget.textColor,
              padding: EdgeInsets.symmetric(
                horizontal: AppHeightConstants.height20,
                vertical: AppHeightConstants.height15,
              ),
            ),
            
            child:  Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
