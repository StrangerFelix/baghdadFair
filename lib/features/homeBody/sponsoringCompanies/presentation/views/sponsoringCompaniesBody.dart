import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/views/components/diamondPartners.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/views/components/goldenPartners.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/views/components/silverPartners.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class SponsoringCompaniesBody extends StatelessWidget {
  const SponsoringCompaniesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: S.of(context).sponsoring_companies
        ),
        const SizedBox(height: 15,),
        const DiamondPartnersGrid(),
        const GoldenPartnersGrid(),
        const SilverPartnersGrid(),
        const SizedBox(height: 15,),
      ],
    );
  }
}