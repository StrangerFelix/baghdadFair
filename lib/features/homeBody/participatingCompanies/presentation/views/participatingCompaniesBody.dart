import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/views/components/participatingCompaniesList.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class ParticipatingCompaniesBody extends StatelessWidget {
  const ParticipatingCompaniesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: S.of(context).par_companies
        ),
        const CustomSearchBar(),
        const ParticipatingCompaniesList(),
        const SizedBox(height: 10,)
      ],
    );
  }
}