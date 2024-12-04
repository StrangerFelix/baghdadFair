import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onPressed,this.color,this.vpadding = 2,this.hpadding = 20,this.textStyle,required this.text,super.key});
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final double vpadding;
  final double hpadding;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: vpadding,horizontal: hpadding),
        decoration: BoxDecoration(
          color: color ?? const Color(0xFF3EA9F9),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          text,
          style: textStyle ?? AppStyles.gradientBoxTextStyle,
        ),
      ),
    );
  }
}