import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/core/utilities/pagesFilters.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/manager/countries/countriesBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/manager/countries/countriesEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/views/components/countriesGrid.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipatingCountriesBody extends StatelessWidget {
  const ParticipatingCountriesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(title: S.of(context).par_countries),
        CustomSearchBar(
          onSubmitted: (val) {
            countriesFilter = val == '' ? "" : 'search=$val';
            context.read<CountriesBloc>().add(GetCountriesEvent(filter: countriesFilter));
          },
        ),
        const CountriesGrid(),
        const SizedBox(height: 50,)
      ],
    );
  }
}