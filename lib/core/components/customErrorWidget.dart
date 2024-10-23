import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, this.error,this.height});
  final String? error;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? MediaQuery.of(context).size.height / 2.5,
      child: Center(
        child: Text(
          error ?? "",
          style: AppStyles.bodySmall,
        ),
      ),
    );
  }
}