import 'package:baghdad_fair/core/components/customHomeButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MapButton extends StatelessWidget {
  const MapButton({required this.text,required this.onTap,super.key});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: AppStyles.boxShadow,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomHomeButton(
                  hasSmallerRing: false,
                  child: SvgPicture.asset(
                    AppAssets.mainAddress,
                    width: 25,
                    height: 25,
                  ),
                ),
                const SizedBox(width: 15,),
                Text(
                  text,
                  style: AppStyles.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}