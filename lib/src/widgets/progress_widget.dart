import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smart_health_care/src/theme/light_color.dart';
import 'package:smart_health_care/src/theme/theme.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({
    Key? key,
    this.value = 0,
    this.totalValue = 100,
    this.activeColor = Colors.blue,
    this.backgroundColor = Colors.grey,
    this.title,
    this.durationTime = const Duration(seconds: 1),
  }) : super(key: key);

  final double value;
  final double totalValue;
  final Color activeColor;
  final Color backgroundColor;
  final String? title;
  final Duration durationTime;

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with TickerProviderStateMixin {
  late double progress;

  @override
  void initState() {
    super.initState();
    // convert value → radians
    progress = (widget.value / widget.totalValue).clamp(0.0, 1.0) * 2 * pi;
  }

  @override
  Widget build(BuildContext context) {
    final dimension = (AppTheme.fullWidth(context) - 10) * .3;

    return Container(
      height: dimension,
      width: dimension,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: progress),
                duration: widget.durationTime,
                builder: (context, value, child) {
                  return CustomPaint(
                    size: Size(dimension, dimension),
                    painter: ProgressPainter(
                      value: value,
                      activeColor: widget.activeColor,
                      backgroundColor: widget.backgroundColor,
                    ),
                  );
                },
              ),
              Text(
                "${widget.value.toInt()}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (widget.title != null)
            Text(
              widget.title!,
              style: const TextStyle(fontSize: 14, color: ColorResources.grey),
            )
        ],
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double value; // in radians
  final Color activeColor;
  final Color backgroundColor;

  ProgressPainter({
    required this.value,
    required this.activeColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const radius = 40.0;

    final inActive = Paint()
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8;

    final active = Paint()
      ..color = activeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 7;

    // draw full background circle
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      2 * pi,
      false,
      inActive,
    );

    // draw active progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2, // start from top
      value,
      false,
      active,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
