import 'package:baghdad_fair/features/homeBody/fairs/presentation/manager/filters/fairsFiltersBloc.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/views/components/sectionTitleAndFilter/fairsSearchAndFiltering.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/views/components/sectionTitleAndFilter/fairsSectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FairsSectionTitleAndFilter extends StatelessWidget {
  const FairsSectionTitleAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FairsFiltersBloc(),
      child: const Column(
        children: [
          FairsSectionTitle(),
          FairsSearchAndFiltering(),
        ],
      ),
    );
  }
}
