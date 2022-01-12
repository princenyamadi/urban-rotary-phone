import 'dart:math';

import 'package:flutter/material.dart';

class ButtonPainter extends CustomPainter {
  Color? buttonBorderColor;
  Color? progressColor;
  double? percentage;
  double? width;

  ButtonPainter(
      {this.buttonBorderColor,
      this.progressColor,
      this.percentage,
      this.width});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = buttonBorderColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;

    Paint complete = Paint()
      ..color = progressColor!
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width!;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);

    double archAngle = 2 * pi * (percentage! / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        archAngle, false, complete);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
