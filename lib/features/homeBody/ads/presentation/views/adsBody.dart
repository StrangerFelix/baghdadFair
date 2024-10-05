import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/ads/presentation/views/components/adsList.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class AdsBody extends StatelessWidget {
  const AdsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: S.of(context).ads
        ),
        const CustomSearchBar(),
        const AdsList()
      ],
    );
  }
}