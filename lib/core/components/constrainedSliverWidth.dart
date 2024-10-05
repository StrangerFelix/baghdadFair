import 'dart:math';

import 'package:flutter/material.dart';

class ConstrainedSliverWidth extends StatelessWidget {
  final Widget sliver;
  final double maxWidth;
  const ConstrainedSliverWidth({
    super.key,
    required this.sliver,
    required this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = (size.width - maxWidth) / 2;
    return SliverPadding(
      padding:
          EdgeInsets.symmetric(horizontal: max(padding, 0)),
      sliver: sliver,
    );
  }
}