import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class AppStyles {

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: primaryBackgroundColor,
    fontFamily: 'expo'
    // fontFamily: 'dubai',
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,

  );

  static const titleLarge = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: primaryTextColor
  );
  static const titleMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: primaryTextColor
  );
  static const titleSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: primaryTextColor
  );
  static const title18 = TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      height: 1.2);
  static const autherSmall = TextStyle(
    fontWeight: FontWeight.bold,
    color: activeColor,
    fontSize: 14
  );
  static const bodySmall = TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  static const paragraphSmall = TextStyle(
    fontSize: 15,
  );
  static const selectionFilterText = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15
  );
  static const gradientBoxTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );
  static BoxDecoration primaryBoxDeocration ({
  bool hasBorRadius = true,
  bool hasSevralParts = false,
  bool hasBoxShadows = true,
  bool withBackground = true,
  double borderRadius = 20,
  AlignmentDirectional alignment = AlignmentDirectional.center,
  }) {
    return BoxDecoration(
      color: withBackground ? Colors.white : null,
      borderRadius: hasSevralParts ? BorderRadiusDirectional.only(
        topStart: alignment == AlignmentDirectional.centerStart 
          ? const Radius.circular(20) : Radius.zero,
        bottomStart: alignment == AlignmentDirectional.centerStart 
          ? const Radius.circular(20) : Radius.zero,
        topEnd: alignment == AlignmentDirectional.centerEnd 
          ? const Radius.circular(20) : Radius.zero,
        bottomEnd: alignment == AlignmentDirectional.centerEnd 
          ? const Radius.circular(20) : Radius.zero,
      ) : hasBorRadius ? BorderRadius.circular(borderRadius) : BorderRadius.circular(0),
      boxShadow: hasBoxShadows ? [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 0),
        ),
      ] : null,
    );
  }
  static BoxDecoration filterBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    border: Border.all(width: 1,color: primaryTextColor)
  );
  static const TextStyle filterTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: primaryTextColor
  );
  static const Color skyBlueColor = Color(0xFF90CDFB);
  static Widget Function(BuildContext, Widget?)? showTimePickerThemeBuilder = (context, child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(
          primary: primaryTextColor,
          onPrimaryContainer: primaryTextColor,
          onPrimary: primaryBackgroundColor,
          onSecondary: primaryTextColor,
          surface: primaryBackgroundColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primaryTextColor,
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey.withOpacity(.5)
        )
      ),
      child: child!,
    );
  };
}

