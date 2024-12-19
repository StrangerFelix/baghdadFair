import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        height: 150,
        decoration: AppStyles.primaryBoxDeocration(hasBorRadius: true),
        child: const Row(
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: AspectRatio(
                  aspectRatio: 3/2,
                  child: CustomCachedImage(''),
                ),
              )
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  Text('fd')
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}