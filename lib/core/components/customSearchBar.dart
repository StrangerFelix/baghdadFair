import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    this.onChanged,
    this.onSubmitted,
    super.key
  });
  final void Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: gradiant1.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ]
      ),
      height: 35,
      margin: const EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        bottom: 10
        
      ),
      child: TextField(
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 25),
          fillColor: Colors.white,
          hintText: S.of(context).search,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: gradiant2, width: 2.0), // Focused border color
          ),
        ),
        onChanged: onChanged,
        onSubmitted: onSubmitted,
      ),
    );
  }
}