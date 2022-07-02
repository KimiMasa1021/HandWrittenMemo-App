import 'package:flutter/material.dart';
import 'package:zen03/model/draw_state.dart';

class Painter extends CustomPainter {
  Painter({required this.state, required this.context});
  final DrawState state;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 1;

    final painter = Paint()
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    for (final points in state.paintList) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: points[0], width: 10, height: 10),
          Radius.circular(strokeWidth),
        ),
        painter,
      );
      // ひとかたまりの線の描画
      for (var i = 0; i < points.length - 1; i++) {
        canvas.drawLine(points[i], points[i + 1], painter);
      }
    }
  }

  @override
  bool shouldRepaint(Painter old) => old.state.paintList != state.paintList;
}
