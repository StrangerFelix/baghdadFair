import 'package:baghdad_fair/core/components/companyDetail.dart';
import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/participatingCompanies/data/models/companiesModel.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ParticipatingCompanyDetailsBody extends StatelessWidget {
  const ParticipatingCompanyDetailsBody({required this.company,super.key});
  final Company company;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 600,
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: horizontalPadding),
                      child: Text(
                        Intl.getCurrentLocale() == 'ar' ? company.nameInArabic ?? "" : company.nameInEnglish ?? "",
                        style: AppStyles.titleSmall.copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: CustomCachedImage(company.photo),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: horizontalPadding,
                        right: horizontalPadding
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: CompanyDetail(
                              icon: AppAssets.flag,
                              data: company.nationality ?? "",
                            )
                          ),
                          const SizedBox(width: 10,),
                          Expanded(
                            child: CompanyDetail(
                              icon: AppAssets.link,
                              data: company.companyType ?? "",
                            )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: CompanyDetail(
                        icon: AppAssets.earth,
                        data: company.specialty ?? "",
                      ),
                    ),
                    company.description != null && company.description != '' ? Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      decoration: AppStyles.titleBoxDexoration,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: horizontalPadding
                      ),
                      child: Text(
                        S.of(context).description,
                        style: AppStyles.title18.copyWith(
                          fontWeight: FontWeight.w200
                        ),
                      ),
                    ) : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 0,
                      ),
                      child: Text(
                        company.description ?? "",
                        style: AppStyles.autherSmall,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      decoration: AppStyles.titleBoxDexoration,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: horizontalPadding
                      ),
                      child: Text(
                        S.of(context).contacts,
                        style: AppStyles.title18.copyWith(
                          fontWeight: FontWeight.w200
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: CompanyDetail(
                              icon: AppAssets.phone,
                              data: company.phone ?? "",
                              iconSize: 30,
                            ),
                          ),
                          Expanded(
                            child: CompanyDetail(
                              icon: AppAssets.emailMain,
                              data: company.email ?? ""
                            ),
                          ),
                        ]
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: horizontalPadding,
                        vertical: 20
                      ),
                      child: CompanyDetail(
                        icon: AppAssets.address,
                        data: company.location ?? ""
                      ),
                    ),
                    const SizedBox(height: 100,),
                  ],
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}