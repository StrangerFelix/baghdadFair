import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/views/components/polygonItem.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class DiamondPartnersGrid extends StatelessWidget {
  const DiamondPartnersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: S.of(context).diamond_partners,
          fontSize: 15,
          verticalPadding: 0,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: 3,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
          itemBuilder: (context,index) {
            return Align(
              alignment: Alignment.center,
              child: PolygonItem(
                image: Image.asset(AppAssets.appImage,fit: BoxFit.cover)
              ),
            );
          }
        )
      ],
    );
  }
}