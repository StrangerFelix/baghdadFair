import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/core/components/constrainedSliverWidth.dart';
import 'package:flutter/material.dart';

class HomeAppBarImage extends StatelessWidget {
  const HomeAppBarImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedSliverWidth(
      maxWidth: 600,
      sliver: SliverAppBar(
        // floating: false,
        expandedHeight: 200,
        collapsedHeight: 100,
        backgroundColor: primaryBackgroundColor,
        flexibleSpace: FlexibleSpaceBar(
          background: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)
            ),
            child: Image.asset(
              AppAssets.appImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

