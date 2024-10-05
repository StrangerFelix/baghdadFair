import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/sectionTitleAndFilter/dropdowns/coGuideSectionDropdownButton.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';


class CoGuideSectionTitle extends StatelessWidget {
  const CoGuideSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  SectionTitle(
      title: S.of(context).companies_guide, 
      button: const CoGuideDropdownSectionButton()
    );
  }
}
