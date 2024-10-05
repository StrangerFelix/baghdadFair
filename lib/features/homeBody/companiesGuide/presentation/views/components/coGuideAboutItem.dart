import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';

class CompaniesGuideAboutItem extends StatelessWidget {
  const CompaniesGuideAboutItem({required this.icon,required this.text,super.key});
  final Widget icon;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          icon,
          Text(
            text ?? "",
            style: AppStyles.autherSmall,
          ),
        ],
      )
    );
  }
}