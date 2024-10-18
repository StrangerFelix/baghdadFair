import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Center(
        child: Text(
          S.of(context).empty,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}