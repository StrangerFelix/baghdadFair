import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({this.validator,required this.hintText,this.height = 35,this.suffix,this.controller,super.key});
  final String hintText;
  final Widget? suffix;
  final double height;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: height,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF90CDFB)),  // Border color when not focused
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),  // Border color when focused
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