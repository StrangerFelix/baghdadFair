import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainHomeInfoItem.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainHomeInfo extends StatelessWidget {
  const MainHomeInfo({
    this.orginazerTitle,
    this.durationTitle,
    this.locationTitle,
    this.specializationTitle,
    super.key
  });
  final String? orginazerTitle;
  final String? durationTitle;
  final String? locationTitle;
  final String? specializationTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 12
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MainHomeInfoItem(
            imageLink: AppAssets.shield, 
            titleName: S.of(context).organizer, 
            title: orginazerTitle ?? ""
          ),
          MainHomeInfoItem(
            imageLink: AppAssets.clock, 
            titleName: S.of(context).duration, 
            title: durationTitle ?? ""
          ),
          MainHomeInfoItem(
            imageLink: AppAssets.address, 
            titleName: S.of(context).address, 
            title: locationTitle ?? ""
          ),
          MainHomeInfoItem(
            imageLink: AppAssets.link, 
            titleName: S.of(context).specialization, 
            title: specializationTitle ?? ""
          ),
        ],
      ),
    );
  }
}