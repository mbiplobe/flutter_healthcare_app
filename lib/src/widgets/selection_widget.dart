import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/controllers/selector_controller.dart';
import 'package:flutter_healthcare_app/src/core/height_constants.dart';
import 'package:flutter_healthcare_app/src/model/selection_model.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class SelectorWidget extends StatefulWidget {
  final SelectorController controller;
  final List<SelectionModel> options;
  final Color selectedColor;
  final Color unselectedColor;

  const SelectorWidget({
    Key? key,
    required this.controller,
    required this.options,
    this.selectedColor = ColorResources.themeRed,
    this.unselectedColor = Colors.white,
  }) : super(key: key);

  @override
  State<SelectorWidget> createState() => _SelectorWidgetState();
}

class _SelectorWidgetState extends State<SelectorWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onControllerChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: AppHeightConstants.height10, vertical: AppHeightConstants.height10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(AppHeightConstants.height13)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .3),
            blurRadius: AppHeightConstants.height10,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Row(
        children: List.generate(widget.options.length, (index) {
          final option = widget.options[index];
          final bool isSelected = option.title == widget.controller.selected;
      
          BorderRadius radius = BorderRadius.zero;
          if (index == 0) {
            radius = const BorderRadius.only(
              topLeft: Radius.circular(AppHeightConstants.height13),
              bottomLeft: Radius.circular(AppHeightConstants.height13),
            );
          } else if (index == widget.options.length - 1) {
            radius = const BorderRadius.only(
              topRight: Radius.circular(AppHeightConstants.height13),
              bottomRight: Radius.circular(AppHeightConstants.height13),
            );
          }
      
          return Expanded(
            child: GestureDetector(
              onTap: () => widget.controller.selected = option.title,
              child: Container(
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: radius,
                  color: isSelected ? widget.selectedColor : widget.unselectedColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      option.icon,
                      size: 24,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                    const SizedBox(width: AppHeightConstants.height5),
                    Text(
                      option.title,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
