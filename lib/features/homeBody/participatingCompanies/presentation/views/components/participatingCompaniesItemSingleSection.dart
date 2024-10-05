import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class ParticipatingCompaniesItemSingleSection extends StatelessWidget {
  const ParticipatingCompaniesItemSingleSection({
    required this.firstText,
    required this.secondText,
    required this.firstIcon,
    required this.secondIcon,
    super.key
  });
  final String firstText;
  final String secondText;
  final Widget firstIcon;
  final Widget secondIcon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Center(
              child: SizedBox(
                height: 35,
                child: firstIcon
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 1,
            color: primaryBackgroundColor,
          ),
          Expanded(
            child: Center(
              child: Text(
                firstText
              ),
            )
          ),
          Container(
            height: double.infinity,
            width: 1,
            color: primaryBackgroundColor,
          ),
          SizedBox(
            width: 50,
            child: Center(
              child: SizedBox(
                height: 35,
                child: secondIcon
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 1,
            color: primaryBackgroundColor,
          ),
          Expanded(
            child: Text(
              secondText
            )
          ),
        ],
      ),
    );
  }
}