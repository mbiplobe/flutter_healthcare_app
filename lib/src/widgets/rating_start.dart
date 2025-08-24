import 'package:flutter/material.dart';
import 'package:flutter_healthcare_app/src/theme/light_color.dart';

class RatingStar extends StatefulWidget {
  const RatingStar({Key? key, required this.rating}) : super(key: key);
  final double rating; // e.g., 3.5

  @override
  State<RatingStar> createState() => _RatingStarState();
}

class _RatingStarState extends State<RatingStar> {
  Widget _buildStar(int index) {
    if (widget.rating >= index + 1) {
      return Icon(Icons.star, color: ColorResources.orange);
    } else if (widget.rating > index && widget.rating < index + 1) {
      return Icon(Icons.star_half, color: ColorResources.orange);
    } else {
      return Icon(Icons.star_border, color: ColorResources.grey);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: widget.rating),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, child) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) => _buildStar(index)),
        );
      },
    );
  }
}
