import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({this.onTap,required this.icon,required this.title,super.key});
  final void Function()? onTap;
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        height: 65,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(icon),
                fit: BoxFit.cover,
                width: 25,
                height: 25,
              ),
              const SizedBox(width: 20,),
              Text(
                title,
                style: AppStyles.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}