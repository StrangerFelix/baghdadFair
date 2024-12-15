import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.fillColor,this.minLines,this.validator,required this.hintText,this.height = 35,this.suffix,this.controller,super.key});
  final String hintText;
  final Widget? suffix;
  final double? height;
  final String? Function(String?)? validator;
  final int? minLines;
  final Color? fillColor;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: minLines == null ? height : null,
      child: TextFormField(
        minLines: minLines,
        maxLines: null,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(vertical: 2.5,horizontal: 15),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: gradiant1),  // Border color when not focused
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: gradiant2, width: 2.0),  // Border color when focused
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gapPadding: 1
          ),
          hintText: hintText,
          suffixIcon: suffix
        ),
      ),
    );
  }
}