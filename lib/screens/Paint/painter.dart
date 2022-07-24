import 'package:flutter/material.dart';

import '../../model/draw_state.dart';

class Painter extends CustomPainter {
  Painter({required this.state, required this.context});
  final DrawState state;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    state.dataPath.asMap().forEach(
      (index, points) {
        final painter = Paint()
          ..strokeCap = StrokeCap.round
          ..isAntiAlias = true
          ..color = points.color
          ..strokeWidth = points.thickness
          ..style = PaintingStyle.stroke;

        // canvas.drawCircle(Offset(points[0].dx, points[0].dy), 0.5, painter);

        canvas.drawPath(points.path, painter);
      },
    );
    if (state.drawPath?.path != null) {
      final painter = Paint()
        ..strokeCap = StrokeCap.round
        ..isAntiAlias = true
        ..color = state.pickColor
        ..strokeWidth = state.thickness
        ..style = PaintingStyle.stroke;
      canvas.drawPath(state.drawPath!.path, painter);
    }
  }

  @override
  bool shouldRepaint(Painter oldDelegate) => true;
}
