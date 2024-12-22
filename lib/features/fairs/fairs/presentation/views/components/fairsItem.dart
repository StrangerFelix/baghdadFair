import 'package:baghdad_fair/core/components/companyInfo.dart';
import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/fairs/fairs/data/models/fairsModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class FairsItem extends StatelessWidget {
  const FairsItem({super.key,required this.fair});
  final Fair fair;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        AppRouter.fairDetails,
        extra: fair
      ),
      child: Container(
        decoration: AppStyles.primaryBoxDeocration(borderRadius: 10),
        child: IntrinsicHeight(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: CustomCachedImage(fair.photo)
                    )
                  )
                ),
                const SizedBox(width: 10,),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fair.name ?? "",
                          style: AppStyles.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        const SizedBox(height: 20,),
                        CompanyInfo(
                          image: AppAssets.dPower,
                          text: Intl.getCurrentLocale() == 'en' ?
                            fair.fairStatus == 'قادمة' ? 'Incoming'
                            : fair.fairStatus == 'جارية' ? 'Pending'
                            : 'Ended'
                            : fair.fairStatus,
                        ),
                        const SizedBox(height: 5,),
                        CompanyInfo(
                          image: AppAssets.dCalendar,
                          text: fair.date!.substring(0,10),
                        )
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
/*
child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: AspectRatio(
                        aspectRatio: 7/6,
                        child: CustomCachedImage(
                          image,
                          fit: BoxFit.contain,
                        )
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title ?? "",
                            style: AppStyles.bodySmall,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 10,),
                          Wrap(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(width: 4,),
                                  const Image(
                                    image: AssetImage(AppAssets.location),
                                    width: 20,
                                  ),
                                  const SizedBox(width: 5,),
                                  Expanded(
                                    child: Text(
                                      location ?? "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppStyles.autherSmall,
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Image(
                                    image: AssetImage(AppAssets.calendar),
                                    width: 28,
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(
                                    date ?? "",
                                    style: AppStyles.autherSmall,
                                  )
                                ],
                              ),
                              
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Text(
                            category ?? "",
                            style: AppStyles.autherSmall,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      FairsAboutItem(
                        icon: const Icon(
                          Icons.square,
                          color: activeColor,
                        ), 
                        text: fairDate
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: activeColor,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      FairsAboutItem(
                        icon: const Icon(
                          Icons.archive,
                          color: activeColor,
                        ), 
                        text: fairCategory
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: activeColor,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      FairsAboutItem(
                        icon: Transform.rotate(
                          angle: pi,
                          child: const Icon(
                            Icons.arrow_back_sharp,
                            color: activeColor,
                          ),
                        ), 
                        text: fairType
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: activeColor,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      FairsAboutItem(
                        icon: const Icon(
                          Icons.power_settings_new,
                          color: activeColor,
                        ), 
                        text: fairCondition
                      ),
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
 */