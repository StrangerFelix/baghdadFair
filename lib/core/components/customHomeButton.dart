import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {
  final double size; // Diameter of the ring
  final double thickness; // Thickness of the ring
  final Widget child; // Centered child widget
  final void Function()? onTap;
  const CustomHomeButton({
    this.onTap,
    super.key,
    this.size = 45.0,
    this.thickness = 2.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: size,
        width: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(size, size),
              painter: GradientRingPainter(
                thickness: thickness,
                gradientColors: [
                  gradiant1,
                  gradiant2,
                  gradiant1,
                  gradiant2,
                  gradiant1,
                ],
              ),
            ),
            CircleAvatar(
              radius: (size / 2) - (size / 10),
              backgroundColor: gradiant1,
              child: CircleAvatar(
                radius: (size / 2) - (size / 7.5),
                backgroundColor: Colors.white,
                child: child
              )
            ),
          ],
        ),
      ),
    );
  }
}

class GradientRingPainter extends CustomPainter {
  final double thickness;
  final List<Color> gradientColors;

  GradientRingPainter({
    required this.thickness,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    final Gradient gradient = SweepGradient(
      colors: gradientColors,
      startAngle: 0.0,
      endAngle: 2 * 3.141592653589793, // Full circle
    );

    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = thickness
      ..isAntiAlias = true;

    final double radius = (size.width - thickness) / 2;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2), // Center of the ring
      radius, // Radius of the ring
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}