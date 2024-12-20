import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FairDetail extends StatelessWidget {
  const FairDetail({required this.icon,this.detail,super.key});
  final String icon;
  final String? detail;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 7
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 25,
            height: 25,
          ),
          const SizedBox(width: 10,),
          Expanded(
            child: Text(
              detail ?? "",
              maxLines: 2,
              style: AppStyles.paragraphSmall,
            ),
          )
        ],
      ),
    );
  }
}