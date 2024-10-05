import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';


class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    this.button,
    this.fontSize,
    this.verticalPadding = 20.0,
    super.key
  });
  final double? fontSize;
  final double verticalPadding;
  final String title;
  final Widget? button;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                title,
                style: AppStyles.titleSmall.copyWith(color: Colors.black,fontSize: fontSize),
              ),
              const Spacer(),
              button ?? const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}