import 'package:flutter/material.dart';
import 'package:zen03/model/draw_state.dart';

class Painter extends CustomPainter {
  Painter({
    required this.state,
    required this.context,
  });

  final DrawState state;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    for (final res in state.pathLists) {
      final painter = Paint()
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..color = res.color
        ..strokeWidth = res.thickness
        ..style = PaintingStyle.stroke;
      canvas.drawPath(res.path, painter);
    }
  }

  @override
  bool shouldRepaint(Painter oldDelegate) => true;
}
