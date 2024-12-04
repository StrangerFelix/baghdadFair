import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class AdsItem extends StatelessWidget {
  const AdsItem({required this.image,super.key, this.location, this.date, this.time});
  final String? image;
  final String? location;
  final String? date;
  final String? time;
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
              child: Center(child: CustomCachedImage(image,fit: BoxFit.contain,)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage(AppAssets.address),
                    width: 20,
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    location ?? "",
                    style: AppStyles.autherSmall,
                  ),
                  const SizedBox(width: 10,),
                  const Image(
                    image: AssetImage(AppAssets.calendar),
                    width: 28,
                  ),
                  const SizedBox(width: 5,),
                  Text(
                    date ?? "",
                    style: AppStyles.autherSmall,
                  ),
                  const SizedBox(width: 10,),
                  const Image(
                    image: AssetImage(AppAssets.time),
                    width: 28,
                  ),
                  const SizedBox(width: 5,),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Text(
                      time ?? "",
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