import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.otherChild,this.width,required this.onPressed,this.color,this.vpadding = 2,this.hpadding = 20,this.textStyle,required this.text,super.key});
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  final double vpadding;
  final double hpadding;
  final double? width;
  final Widget? otherChild;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      onTap: onPressed,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: vpadding,horizontal: hpadding),
        decoration: BoxDecoration(
          color: color ?? gradiant2,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: textStyle ?? AppStyles.bodySmall.copyWith(color: Colors.white),
              ),
              otherChild ?? const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}