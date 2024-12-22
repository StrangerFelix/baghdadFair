import 'package:baghdad_fair/core/components/companyInfo.dart';
import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/participatingCompanies/data/models/companiesModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ParticipatingCompaniesItem extends StatelessWidget {
  const ParticipatingCompaniesItem({required this.company,super.key});
  final Company company;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppRouter.participatingCompanyDetails,
          extra: company
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Container(
          decoration: AppStyles.primaryBoxDeocration(hasBorRadius: true),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AspectRatio(
                      aspectRatio: 3/2,
                      child: CustomCachedImage(company.photo),
                    ),
                  )
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Intl.getCurrentLocale() == 'ar' ? company.nameInArabic ?? "" : company.nameInEnglish ?? "",
                          style: AppStyles.bodySmall.copyWith(fontWeight: FontWeight.w300),
                          textAlign: TextAlign.start,
                          maxLines: 3,
                        ),
                        const SizedBox(height: 20,),
                        CompanyInfo(
                          image: AppAssets.call,
                          iconSize: 20,
                          text: company.phone ?? "",
                        ),
                        const SizedBox(height: 5,),
                        CompanyInfo(
                          image: AppAssets.email,
                          text: company.email ?? "",
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}