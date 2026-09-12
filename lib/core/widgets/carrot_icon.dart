import 'package:flutter/material.dart';

class CarrotIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const CarrotIcon({
    super.key,
    this.size = 32,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _CarrotPainter(overrideColor: color),
    );
  }
}

class _CarrotPainter extends CustomPainter {
  final Color? overrideColor;

  _CarrotPainter({this.overrideColor});

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final orangeColor = overrideColor ?? const Color(0xFFF3603F);
    final greenColor = overrideColor ?? const Color(0xFF53B175);

    final leavesPaint = Paint()
      ..color = greenColor
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    final carrotPaint = Paint()
      ..color = orangeColor
      ..style = PaintingStyle.fill;

    // Leaves
    final leafPath = Path();
    leafPath.moveTo(w * 0.50, h * 0.35);
    leafPath.quadraticBezierTo(w * 0.40, h * 0.05, w * 0.28, h * 0.12);
    leafPath.quadraticBezierTo(w * 0.38, h * 0.22, w * 0.48, h * 0.35);

    leafPath.moveTo(w * 0.50, h * 0.35);
    leafPath.quadraticBezierTo(w * 0.52, h * 0.02, w * 0.55, h * 0.02);
    leafPath.quadraticBezierTo(w * 0.58, h * 0.15, w * 0.53, h * 0.35);

    leafPath.moveTo(w * 0.52, h * 0.35);
    leafPath.quadraticBezierTo(w * 0.65, h * 0.08, w * 0.74, h * 0.15);
    leafPath.quadraticBezierTo(w * 0.62, h * 0.25, w * 0.54, h * 0.35);

    canvas.drawPath(leafPath, leavesPaint);

    // Carrot body
    final bodyPath = Path();
    bodyPath.moveTo(w * 0.32, h * 0.35);
    bodyPath.quadraticBezierTo(w * 0.50, h * 0.30, w * 0.68, h * 0.35);
    bodyPath.quadraticBezierTo(w * 0.72, h * 0.55, w * 0.54, h * 0.95);
    bodyPath.quadraticBezierTo(w * 0.50, h * 0.98, w * 0.46, h * 0.95);
    bodyPath.quadraticBezierTo(w * 0.28, h * 0.55, w * 0.32, h * 0.35);
    bodyPath.close();

    canvas.drawPath(bodyPath, carrotPaint);
  }

  @override
  bool shouldRepaint(covariant _CarrotPainter oldDelegate) =>
      oldDelegate.overrideColor != overrideColor;
}
