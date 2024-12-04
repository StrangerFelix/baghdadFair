import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class BaghdadFairTitle extends StatelessWidget {
  const BaghdadFairTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding * 1.5,
        vertical: 15
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).title,
            style: AppStyles.bodySmall,
          ),
          const Image(
            image: AssetImage(AppAssets.logo),
            height: 45,
          )
        ],
      ),
    );
  }
}