import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class SectionTitleButton extends StatelessWidget {
  const SectionTitleButton({required this.text,required this.onTap,this.icon,super.key});
  final String text;
  final Widget? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 10
        ),
        decoration: const BoxDecoration(
          color: primaryTextColor,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white
              ),
            ),
            const SizedBox(width: 10,),
            icon ?? const SizedBox()
          ],
        ),
      ),
    );
  }
}