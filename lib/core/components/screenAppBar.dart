import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar screenAppBar = AppBar(
  centerTitle: false,
  title: Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(
          bottom: 2.5,
        ),
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
    ],
  ),
);