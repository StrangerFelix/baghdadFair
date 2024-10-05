import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainDetails extends StatelessWidget {
  const MainDetails({this.details,super.key});
  final String? details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).details,
            style: AppStyles.title18,
          ),
          const SizedBox(height: 5,),
          Text(
            details ?? "",
            style: AppStyles.paragraphSmall,
          ),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(AppAssets.file),
                width: 30,
              ),
              const SizedBox(width: 10,),
              Text(
                S.of(context).participation_instructions,
                style: AppStyles.title18,
              ),
            ],
          )
        ],
      ),
    );
  }
}