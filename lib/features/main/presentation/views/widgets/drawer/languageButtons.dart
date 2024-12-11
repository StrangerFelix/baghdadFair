import 'package:baghdad_fair/core/components/customDrawerButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/main/presentation/managers/language/languageCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageButtons extends StatelessWidget {
  const LanguageButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primaryBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              )
            ),
            child: CustomDrawerButton(
              icon: AppAssets.arabic, 
              title: 'العربية',
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.of(context).pop();
                BlocProvider.of<LanguageCubit>(context).changeLanguage('Arabic',context);
              },
            ),
          ),
          const SizedBox(height: 2,),
          Container(
            decoration: const BoxDecoration(
              color: primaryBackgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )
            ),
            child: CustomDrawerButton(
              icon: AppAssets.english, 
              title: 'English',
              onTap: () {
                HapticFeedback.lightImpact();
                Navigator.of(context).pop();
                BlocProvider.of<LanguageCubit>(context).changeLanguage('English',context);
              },
            ),
          ),
        ],
      ),
    );
  }
}