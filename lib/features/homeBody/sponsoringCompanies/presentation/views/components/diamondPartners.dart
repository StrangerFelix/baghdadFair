import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/data/models/sponsoringModel.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/manager/sponsors/sponsorsBloc.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/manager/sponsors/sponsorsStates.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/views/components/polygonItem.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiamondPartnersGrid extends StatefulWidget {
  const DiamondPartnersGrid({super.key});

  @override
  State<DiamondPartnersGrid> createState() => _DiamondPartnersGridState();
}

class _DiamondPartnersGridState extends State<DiamondPartnersGrid> {
  List<Sponsor> sponsors = [];
  String? error;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SponsorsBloc, SponsorsStates>(
      builder: (context, state) {
        if (state is SponsorsFailure) {
          error = state.error;
        }
        if (state is SponsorsLoaded) {
          sponsors = [];
          for (var sponsor in state.model.data!.response!) {
            if (sponsor.sponsorType == 'diamond') {
              sponsors.add(sponsor);
            }
          }
        }
        return Column(
          children: [
            SectionTitle(
              title: S.of(context).diamond_partners,
              fontSize: 15,
              verticalPadding: 0,
            ),
            state is! SponsorsLoading ?
            state is! SponsorsFailure ?
            sponsors.isNotEmpty ?
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: sponsors.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.center,
                  child: PolygonItem(
                    image: CustomCachedImage(
                      sponsors[index].image
                    )
                  ),
                );
              }
            ): const CustomEmptyWidget()
            : CustomErrorWidget(error: error,height: 150,) 
            : const CustomLoadingWidget(height: 150,)
          ],
        );
      },
    );
  }
}
