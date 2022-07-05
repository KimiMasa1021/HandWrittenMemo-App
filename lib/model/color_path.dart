import 'package:flutter/material.dart';

class ColorPath {
  final Path path = Path();
  final Color color;
  final double thickness;
  ColorPath(this.color, this.thickness);

  void setFirstPoint(Offset point) {
    path.moveTo(point.dx, point.dy);
  }

  void updatePath(Offset point) {
    path.lineTo(point.dx, point.dy);
  }
}
