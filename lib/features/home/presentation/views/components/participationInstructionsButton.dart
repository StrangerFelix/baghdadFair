import 'package:baghdad_fair/core/components/customHomeButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ParticipationInstructionsButton extends StatelessWidget {
  const ParticipationInstructionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: horizontalPadding),
      child: GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomHomeButton(
              hasSmallerRing: false,
              child: SvgPicture.asset(
                AppAssets.file,
                width: 25,
                height: 25,
              ),
            ),
            const SizedBox(width: 10,),
            Text(
              S.of(context).participation_instructions,
              style: AppStyles.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}