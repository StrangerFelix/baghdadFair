import 'package:baghdad_fair/core/components/constrainedSliverWidth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConstrainedSliverToBoxAdapter extends StatelessWidget {
  const ConstrainedSliverToBoxAdapter({required this.child,this.maxWidth = 600,super.key});
  final double maxWidth;
  final StatefulNavigationShell child;
  @override
  Widget build(BuildContext context) {
    return ConstrainedSliverWidth(
      maxWidth: maxWidth,
      sliver: SliverToBoxAdapter(
        child: child,
      ),
    );
  }
}