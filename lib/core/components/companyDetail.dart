import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CompanyDetail extends StatelessWidget {
  const CompanyDetail({required this.icon,this.iconSize = 35.0,this.data,super.key});
  final String icon;
  final String? data;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          SvgPicture.asset(
            icon,
            width: iconSize,
            height: iconSize,
          ),
          SizedBox(width: 35 - iconSize + 20,),
          Expanded(
            child: Text(
              data ?? "",
              style: AppStyles.bodySmall.copyWith(
                color: Colors.black.withOpacity(.75),
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
              maxLines: 2
            ),
          ),
          const SizedBox(width: 5,),
        ],
      );
  }
}