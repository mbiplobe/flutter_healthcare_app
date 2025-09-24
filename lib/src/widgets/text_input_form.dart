import 'package:flutter/material.dart';
import 'package:smarthealthcare/src/core/height_constants.dart';
import 'package:smarthealthcare/src/theme/extention.dart';
import 'package:smarthealthcare/src/theme/light_color.dart';
import 'package:smarthealthcare/src/theme/text_styles.dart';

class TextInputWidger extends StatefulWidget {
  final TextEditingController mController;
  final String? hintText;
  final bool isPassword;
  final TextInputType? inputType;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const TextInputWidger({
    super.key,
    required this.mController,
    this.hintText,
    required this.isPassword,
    this.inputType,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<TextInputWidger> createState() => _TextInputWidgerState();
}

class _TextInputWidgerState extends State<TextInputWidger> {
  bool _obscure = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppHeightConstants.height8),
      child: TextField(
        controller: widget.mController,
        obscureText: _obscure,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorResources.themeRed,
              width: 1.5,
            ), // when not focused
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: widget.hintText ?? '',
          hintStyle: TextStyles.body.subTitleColor,
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, color: ColorResources.themeRed)
              : null,
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility : Icons.visibility_off,
                    color: ColorResources.themeRed,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                )
              : widget.suffixIcon != null
              ? Icon(widget.suffixIcon, color: ColorResources.themeRed)
              : null,
        ),
      ),
    );
  }
}
