import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/data/models/sponsoringModel.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/manager/sponsors/sponsorsBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/manager/sponsors/sponsorsStates.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/views/components/polygonItem.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoldenPartnersGrid extends StatefulWidget {
  const GoldenPartnersGrid({super.key});

  @override
  State<GoldenPartnersGrid> createState() => _GoldenPartnersGridState();
}

class _GoldenPartnersGridState extends State<GoldenPartnersGrid> {
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
            if (sponsor.sponsorType == 'gold') {
              sponsors.add(sponsor);
            }
          }
        }
        return Column(
          children: [
            SectionTitle(
              title: S.of(context).golden_partners,
              fontSize: 15,
              verticalPadding: 0,
            ),
            state is! SponsorsLoading ?
            state is! SponsorsFailure ?
            sponsors.isNotEmpty ?
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
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
            )
            : const CustomEmptyWidget()
            : CustomErrorWidget(error: error,height: 150,) 
            : const CustomLoadingWidget(height: 150,)
          ],
        );
      },
    );
  }
}
