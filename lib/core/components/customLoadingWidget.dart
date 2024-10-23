import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({this.height,super.key});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? MediaQuery.of(context).size.height / 2.5,
      child: const Center(
        child: CustomLoadingIndicator(),
      ),
    );
  }
}