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
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: horizontalPadding
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Center(
              child: CustomCachedImage(image,fit: BoxFit.contain,)
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: horizontalPadding,
            ),
            child: Column(
              children: [
                const SizedBox(height: 15,),
                Row(
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
                    const Spacer(),
                    const Image(
                      image: AssetImage(AppAssets.calendar),
                      width: 28,
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      date ?? "",
                      style: AppStyles.autherSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}