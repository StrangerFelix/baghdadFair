import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({required this.image,this.iconSize = 25.0,this.text,super.key});
  final String image;
  final String? text;
  final double iconSize;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          image,
          width: iconSize,
          height: iconSize,
        ),
        SizedBox(width: 30 - iconSize,),
        Expanded(
          child: Text(
            text ?? "",
            maxLines: 2,
            style: AppStyles.autherSmall.copyWith(color: gradiant2.withOpacity(.75),fontSize: 13),
          ),
        )
      ],
    );
  }
}