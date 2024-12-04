import 'dart:math';

import 'package:flutter/material.dart';

class PolygonClipper extends CustomClipper<Path> {
  final int sides;

  PolygonClipper({this.sides = 3});

  @override
  Path getClip(Size size) {
    final double radius = size.width / 2;
    final double angle = (2 * pi) / sides;

    Path path = Path();
    Offset center = Offset(size.width / 2, size.height / 2);

    for (int i = 0; i < sides; i++) {
      double x = center.dx + radius * cos(i * angle);
      double y = center.dy + radius * sin(i * angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}