import 'dart:ui';
import 'package:baghdad_fair/core/components/customHomeButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/main/presentation/views/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      floating: true,
      pinned: false,
      backgroundColor: appbarColor.withOpacity(0),
      flexibleSpace: FlexibleSpaceBar(
        background: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
          child: Container(
            color: Colors.white.withOpacity(0.75), // Optional overlay
          ),
        ),
        centerTitle: false,
        titlePadding: const EdgeInsets.only(left: 35, right: 35,bottom: 10),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.5),
              child: SvgPicture.asset(
                AppAssets.bflogo,
                width: 40,
              ),
            ),
            const SizedBox(width: 10,),
            SvgPicture.asset(
              AppAssets.titleText,
              height: 45,
            ),
            const Spacer(),
            CustomHomeButton(
              size: 40,
              onTap: () {
                HapticFeedback.mediumImpact();
                openDrawer(context,MediaQuery.of(context).padding.top);
              },
              child: SvgPicture.asset(AppAssets.burgerMenu),
            )
          ],
        ),
        
      ),
    );
  }
}

