import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/core/utilities/pagesFilters.dart';
import 'package:baghdad_fair/features/ads/presentation/manager/ads/adsBloc.dart';
import 'package:baghdad_fair/features/ads/presentation/manager/ads/adsEvents.dart';
import 'package:baghdad_fair/features/ads/presentation/views/components/adsList.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsBody extends StatelessWidget {
  const AdsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: S.of(context).ads
        ),
        CustomSearchBar(
          onSubmitted: (val) {
            adsFilter = val == '' ? "" : 'search=$val';
            context.read<AdsBloc>().add(GetAdsEvent(filter: adsFilter));
          },
        ),
        const AdsList()
      ],
    );
  }
}