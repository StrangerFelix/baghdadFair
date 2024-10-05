import 'dart:math';

import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/coGuideAboutItem.dart';
import 'package:flutter/material.dart';

class CompaniesGuideItem extends StatelessWidget {
  const CompaniesGuideItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.primaryBoxDeocration(borderRadius: 10),
      height: 230,
      child: Column(
        children: [
          const Expanded(
            flex: 7,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: AspectRatio(
                      aspectRatio: 7/6,
                      child: Image(
                        image: AssetImage(AppAssets.appImage),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 8,
                    child: Column(
                      
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'معرض ومؤتمر طاقة العراق الدولي العاشر',
                          style: AppStyles.bodySmall,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Image(
                              image: AssetImage(AppAssets.address),
                              width: 20,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              'بغداد',
                              style: AppStyles.autherSmall,
                            ),
                            SizedBox(width: 10,),
                            Image(
                              image: AssetImage(AppAssets.calendar),
                              width: 28,
                            ),
                            SizedBox(width: 5,),
                            Text(
                              '2024/4/20',
                              style: AppStyles.autherSmall,
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'قطاع انتاج الطاقة الكهربائية',
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
                    const CompaniesGuideAboutItem(
                      icon: Icon(
                        Icons.phone,
                        color: activeColor,
                      ), 
                      text: '2024/7/11'
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: activeColor,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    const CompaniesGuideAboutItem(
                      icon: Icon(
                        Icons.email_sharp,
                        color: activeColor,
                      ), 
                      text: 'الطاقة والاعمار والاستثمار'
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: activeColor,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    CompaniesGuideAboutItem(
                      icon: Transform.rotate(
                        angle: pi,
                        child: const Icon(
                          Icons.info_outlined,
                          color: activeColor,
                        ),
                      ), 
                      text: 'خاص'
                    ),
                    Container(
                      height: 50,
                      width: 1,
                      color: activeColor,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    const CompaniesGuideAboutItem(
                      icon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: activeColor,
                      ), 
                      text: '6'
                    ),
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