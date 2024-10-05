import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/views/components/participatingCompaniesItemSingleSection.dart';
import 'package:flutter/material.dart';

class ParticipatingCompaniesItem extends StatelessWidget {
  const ParticipatingCompaniesItem({super.key, this.name, this.secondName, this.email, this.phone, this.companyDirection, this.companyType, this.location, this.localOrNot});
  final String? name;
  final String? secondName;
  final String? email;
  final String? phone;
  final String? companyDirection; // داخلية او خارجية 
  final String? companyType; // مؤسسة ام جمعية
  final String? location;
  final String? localOrNot;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.primaryBoxDeocration(hasBorRadius: false),
      child: Column(
        children: [
          ParticipatingCompaniesItemSingleSection(
            firstIcon: const Image(
              image: AssetImage(AppAssets.userLarge)
            ), 
            firstText: name ?? "", 
            secondIcon: const Image(
              image: AssetImage(AppAssets.name)
            ),
            secondText: secondName ?? "" 
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: primaryBackgroundColor,
          ),
          ParticipatingCompaniesItemSingleSection(
            firstIcon: const Image(
              image: AssetImage(AppAssets.emailLarge)
            ), 
            firstText: email ?? "", 
            secondIcon: const Image(
              image: AssetImage(AppAssets.phoneLarge)
            ),
            secondText: phone ?? ""
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: primaryBackgroundColor,
          ),
          ParticipatingCompaniesItemSingleSection(
            firstIcon: const Image(
              image: AssetImage(AppAssets.earth)
            ), 
            firstText: companyDirection ?? "", 
            secondIcon: const Image(
              image: AssetImage(AppAssets.link)
            ),
            secondText: companyType ?? ""
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: primaryBackgroundColor,
          ),
          ParticipatingCompaniesItemSingleSection(
            firstIcon: const Image(
              image: AssetImage(AppAssets.address)
            ), 
            firstText: location ?? "", 
            secondIcon: const Image(
              image: AssetImage(AppAssets.flag)
            ),
            secondText: localOrNot ?? ""
          ),
        ],
      ),
    );
  }
}