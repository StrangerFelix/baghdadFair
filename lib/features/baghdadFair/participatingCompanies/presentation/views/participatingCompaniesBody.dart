import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/core/utilities/pagesFilters.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/views/components/participatingCompaniesList.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipatingCompaniesBody extends StatelessWidget {
  const ParticipatingCompaniesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: S.of(context).par_companies
        ),
        CustomSearchBar(
          onSubmitted: (val) {
            companiesFilter = val == '' ? "" : 'search=$val';
            context.read<CompaniesBloc>().add(GetCompaniesEvent(filter: companiesFilter));
          },
        ),
        const ParticipatingCompaniesList(),
        const SizedBox(height: 10,)
      ],
    );
  }
}