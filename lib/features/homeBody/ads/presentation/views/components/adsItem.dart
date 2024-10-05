import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class AdsItem extends StatelessWidget {
  const AdsItem({required this.image,super.key});
  final Widget image;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.primaryBoxDeocration(hasBorRadius: false),
      height: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.all(horizontalPadding),
              child: image,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(AppAssets.address),
                    width: 20,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    'بغداد',
                    style: AppStyles.autherSmall,
                  ),
                  SizedBox(width: 10,),
                  Image(
                    image: AssetImage(AppAssets.calendar),
                    width: 28,
                  ),
                  SizedBox(width: 5,),
                  Text(
                    '2024/4/20',
                    style: AppStyles.autherSmall,
                  ),
                  SizedBox(width: 10,),
                  Image(
                    image: AssetImage(AppAssets.time),
                    width: 28,
                  ),
                  SizedBox(width: 5,),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      '2:14 AM',
                      style: AppStyles.autherSmall,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}