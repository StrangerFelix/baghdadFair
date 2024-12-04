import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/components/constrainedSliverWidth.dart';
import 'package:flutter/material.dart';

class HomeAppBarImage extends StatelessWidget {
  const HomeAppBarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConstrainedSliverWidth(
      maxWidth: 600,
      sliver: SliverToBoxAdapter(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          child: Image(
            image: AssetImage(AppAssets.appImage)
          ),
        ),
      ),
    );
  }
}

