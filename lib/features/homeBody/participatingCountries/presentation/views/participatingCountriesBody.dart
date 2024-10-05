import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/participatingCountries/presentation/views/components/countriesGrid.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class ParticipatingCountriesBody extends StatelessWidget {
  const ParticipatingCountriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: S.of(context).par_countries),
        const CustomSearchBar(),
        const CountriesGrid(),
      ],
    );
  }
}