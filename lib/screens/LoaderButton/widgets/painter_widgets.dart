import 'package:custom_paint_projects/screens/LoaderButton/button_painter.dart';
import 'package:custom_paint_projects/screens/LoaderButton/green_clipper.dart';
import 'package:flutter/material.dart';

class PainterWidgets {
  static Widget buildShape() {
    return ClipPath(
      clipper: WaveClipper(),
      child: Container(
        color: Colors.greenAccent.withOpacity(0.7),
      ),
    );
  }

  static Widget buildButtonAnimation(
      {required double height,
      required double width,
      required double percentValue,
      required Function onPressed}) {
    return Center(
      child: Container(
        height: height,
        width: width,
        child: CustomPaint(
          foregroundPainter: ButtonPainter(
            buttonBorderColor: Colors.grey[300],
            progressColor: Colors.red,
            percentage: percentValue,
            width: 8.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Text(
                'Press\n ${percentValue.toInt()}%',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () => onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
