import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/main/presentation/managers/language/languageCubit.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageDropDownButton extends StatefulWidget {
  const LanguageDropDownButton({super.key});

  @override
  State<LanguageDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<LanguageDropDownButton> {
  String? selectedValue;

  final List<String> dropdownItems = [
    'العربية',
    'English',
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      underline: const SizedBox(),
      value: selectedValue,
      hint: Text(
        S.of(context).changeLanguageButton,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: primaryTextColor,
        ),
      ),
      iconEnabledColor: primaryTextColor,
      items: dropdownItems.map((String item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Center(child: Text(item)),
        );
      }).toList(),
      
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
          BlocProvider.of<LanguageCubit>(context).changeLanguage('$selectedValue',context);
          
        });
      },
    );
  } 
}