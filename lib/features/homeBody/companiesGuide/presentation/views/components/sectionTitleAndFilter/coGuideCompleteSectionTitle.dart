import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersBloc.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/sectionTitleAndFilter/coGuideSearchAndFiltering.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/sectionTitleAndFilter/coGuideSectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoGuideSectionTitleAndFilter extends StatelessWidget {
  const CoGuideSectionTitleAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoGuideFiltersBloc(),
      child: const Column(
        children: [
          CoGuideSectionTitle(),
          CoGuideSearchAndFiltering(),
        ],
      ),
    );
  }
}
