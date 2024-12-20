import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/components/fairDetail.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/fairs/fairs/data/models/fairsModel.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FairDetailsBody extends StatelessWidget {
  const FairDetailsBody({required this.fair,super.key});
  final Fair fair;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: 600,
              minHeight: constraints.maxHeight
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: CustomCachedImage(fair.photo)
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: horizontalPadding
                    ),
                    child: Text(
                      fair.name ?? "",
                      style: AppStyles.titleSmall.copyWith(fontWeight: FontWeight.w300),
                    ),
                  ),
                  Container(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 25
                    ),
                    child: Text(
                      fair.description ?? "",
                      style: AppStyles.autherSmall,
                    ),
                  ),
                  Container(
                    decoration: AppStyles.titleBoxDexoration,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: horizontalPadding
                    ),
                    child: Text(
                      S.of(context).fair_details,
                      style: AppStyles.title18.copyWith(
                        fontWeight: FontWeight.w200
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  FairDetail(
                    icon: AppAssets.dPower,
                    detail: Intl.getCurrentLocale() == 'en' ?
                      fair.fairStatus == 'قادمة' ? 'Incoming'
                      : fair.fairStatus == 'جارية' ? ' Pending'
                      : 'Ended'
                      : fair.fairStatus
                  ),
                  FairDetail(
                    icon: AppAssets.dFair,
                    detail: fair.specialty,
                  ),
                  FairDetail(
                    icon: AppAssets.dCalendar,
                    detail: fair.date!.substring(0,10),
                  ),
                  FairDetail(
                    icon: AppAssets.dArrow,
                    detail: Intl.getCurrentLocale() == 'en' ? 
                      fair.fairsLocation == "خارج العراق" ? 'Outside baghdad' : "Inside baghdad"
                      : fair.fairsLocation == 'خارج العراق' ? "خارج بغداد" : "داخل بغداد",
                  ),
                  FairDetail(
                    icon: AppAssets.dLocation,
                    detail: fair.location,
                  ),
                  const SizedBox(height: 50,)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}