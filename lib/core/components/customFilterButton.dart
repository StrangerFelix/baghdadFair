import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomFilterButton extends StatelessWidget {
  const CustomFilterButton({required this.text,this.onTap,super.key});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 20
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: const BoxDecoration(
          color: gradiant2,
          borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}