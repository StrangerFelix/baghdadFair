import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainDetails extends StatelessWidget {
  const MainDetails({this.details,super.key});
  final String? details;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryFocusedColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: horizontalPadding),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).details,
              style: AppStyles.title18,
            ),
            const SizedBox(height: 10,),
            Text(
              details ?? "",
              style: AppStyles.paragraphSmall,
            ),
          ],
        ),
      ),
    );
  }
}