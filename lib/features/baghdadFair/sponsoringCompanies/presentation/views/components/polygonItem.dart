import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/views/components/polygonClipper.dart';
import 'package:flutter/material.dart';

class PolygonItem extends StatelessWidget {
  const PolygonItem({required this.image,super.key});
  final Widget image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 110,
      child: ClipPath(
        clipper: PolygonClipper(sides: 6),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                gradiant1,
                gradiant2
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          child: Center(
            child: ClipPath(
              clipper: PolygonClipper(sides: 6),
              child: Container(
                color: Colors.white,
                width: 105,
                height: 105,
                child: image
              ),
            ),
          ),
        )
      ),
    );
  }
}