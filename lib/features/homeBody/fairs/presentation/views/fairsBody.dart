import 'package:baghdad_fair/features/homeBody/fairs/presentation/views/components/fairsList.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/views/components/sectionTitleAndFilter/fairsCompleteSectionTitle.dart';
import 'package:flutter/material.dart';

class FairsBody extends StatelessWidget {
  const FairsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FairsSectionTitleAndFilter(),
        FairsList()
      ],
    );
  }
}