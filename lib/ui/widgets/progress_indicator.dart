import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/gen/colors.gen.dart';

class PlacesProgressIndicatorPainter extends CustomPainter {
  final double value;
  final double strokeWidth;
  final List<Color> foregroundColors;
  final Color color;

  const PlacesProgressIndicatorPainter({
    this.value = 0.0,
    required this.strokeWidth,
    required this.foregroundColors,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;
    final scapSize = strokeWidth / 2;
    final scapToDegree = scapSize / radius;

    final sweepAngle = _deg2Rad(360.0) - (scapToDegree * 2);
    final startAngle = _deg2Rad(-100) + scapToDegree;
    final endAngle = _deg2Rad(-100 + 360.0);

    final rect = Rect.fromCircle(
      center: center,
      radius: radius,
    );

    canvas
      ..drawCircle(
        center,
        radius,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = color
          ..strokeWidth = strokeWidth,
      )
      ..drawArc(
        rect,
        startAngle,
        value * sweepAngle,
        false,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeWidth = strokeWidth
          ..shader = SweepGradient(
            startAngle: startAngle,
            endAngle: endAngle,
            tileMode: TileMode.repeated,
            colors: foregroundColors,
          ).createShader(rect),
      );
  }

  @override
  bool shouldRepaint(PlacesProgressIndicatorPainter oldDelegate) {
    return oldDelegate.value != value;
  }

  double _deg2Rad(double deg) => deg * pi / 180;
}

class PlacesProgressIndicator extends StatelessWidget {
  final double? value;
  final double strokeWidth;
  final List<Color> foregroundColors;
  final Color color;
  final double size;
  final Widget? child;

  const PlacesProgressIndicator({
    this.value,
    this.strokeWidth = 6.0,
    this.foregroundColors = const [
      ColorName.secondary2,
      ColorName.background,
    ],
    this.color = ColorName.background,
    this.size = 40.0,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RepaintBoundary(
        child: CustomPaint(
          size: Size(size, size),
          isComplex: true,
          painter: PlacesProgressIndicatorPainter(
            value: value ?? 0.0,
            strokeWidth: strokeWidth,
            foregroundColors: foregroundColors,
            color: color,
          ),
          child: child,
        ),
      ),
    );
  }
}
