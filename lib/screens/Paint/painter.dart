import 'package:flutter/material.dart';
import 'package:zen03/model/draw_state.dart';

class Painter extends CustomPainter {
  Painter({required this.state, required this.context});
  final DrawState state;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    state.paintList.asMap().forEach((index, points) {
      final painter = Paint()
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..color = state.colorList[index] //新しい配列を追加して太さとか色をカエル
        ..strokeWidth = state.thicknessList[index]
        ..style = PaintingStyle.stroke;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromCenter(center: points[0], width: 5, height: 5),
          const Radius.circular(5),
        ),
        painter,
      );

      for (var i = 0; i < points.length - 1; i++) {
        canvas.drawLine(points[i], points[i + 1], painter);
      }
    });
  }

  @override
  bool shouldRepaint(Painter old) => old.state.paintList != state.paintList;
}
