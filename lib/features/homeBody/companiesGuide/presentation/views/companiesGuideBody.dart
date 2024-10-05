import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/coGuideList.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/sectionTitleAndFilter/coGuideCompleteSectionTitle.dart';
import 'package:flutter/material.dart';

class CompaniesGuideBody extends StatelessWidget {
  const CompaniesGuideBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CoGuideSectionTitleAndFilter(),
        CompaniesGuideList()
      ],
    );
  }
}