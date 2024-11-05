import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';

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
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(AppAssets.address),
                width: 30,
              ),
              const SizedBox(width: 10,),
              Text(
                text,
                style: AppStyles.title18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}