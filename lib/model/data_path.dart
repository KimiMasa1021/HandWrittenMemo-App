import 'package:flutter/material.dart';

class DataPath {
  Path path = Path();
  final Color color;
  double thickness;
  Offset? firstPoint;
  DataPath({
    required this.color,
    required this.thickness,
    this.firstPoint,
  });
}
