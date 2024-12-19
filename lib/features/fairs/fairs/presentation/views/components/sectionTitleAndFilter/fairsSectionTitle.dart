import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';


class FairsSectionTitle extends StatelessWidget {
  const FairsSectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  SectionTitle(
      title: S.of(context).fairs, 
      // button: const FairDropdownSectionButton()
    );
  }
}
