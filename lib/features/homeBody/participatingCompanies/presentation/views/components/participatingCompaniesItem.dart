import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/views/components/participatingCompaniesItemSingleSection.dart';
import 'package:flutter/material.dart';

class ParticipatingCompaniesItem extends StatefulWidget {
  const ParticipatingCompaniesItem({super.key});

  @override
  State<ParticipatingCompaniesItem> createState() => _ParticipatingCompaniesItemState();
}

class _ParticipatingCompaniesItemState extends State<ParticipatingCompaniesItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.primaryBoxDeocration(hasBorRadius: false),
      child: Column(
        children: [
          const ParticipatingCompaniesItemSingleSection(
            firstIcon: Image(
              image: AssetImage(AppAssets.userLarge)
            ), 
            firstText: 'العتبة العباسية المقدسة', 
            secondIcon: Image(
              image: AssetImage(AppAssets.name)
            ),
            secondText: 'Al-abbas Holy Shrine' 
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: primaryBackgroundColor,
          ),
          const ParticipatingCompaniesItemSingleSection(
            firstIcon: Image(
              image: AssetImage(AppAssets.emailLarge)
            ), 
            firstText: 'العتبة العباسية المقدسة', 
            secondIcon: Image(
              image: AssetImage(AppAssets.phoneLarge)
            ),
            secondText: 'Al-abbas Holy Shrine' 
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: primaryBackgroundColor,
          ),
          const ParticipatingCompaniesItemSingleSection(
            firstIcon: Image(
              image: AssetImage(AppAssets.earth)
            ), 
            firstText: 'العتبة العباسية المقدسة', 
            secondIcon: Image(
              image: AssetImage(AppAssets.link)
            ),
            secondText: 'Al-abbas Holy Shrine' 
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: primaryBackgroundColor,
          ),
          const ParticipatingCompaniesItemSingleSection(
            firstIcon: Image(
              image: AssetImage(AppAssets.address)
            ), 
            firstText: 'العتبة العباسية المقدسة', 
            secondIcon: Image(
              image: AssetImage(AppAssets.flag)
            ),
            secondText: 'Al-abbas Holy Shrine' 
          ),
        ],
      ),
    );
  }
}