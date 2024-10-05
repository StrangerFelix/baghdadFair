import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/coGuideAboutItem.dart';
import 'package:flutter/material.dart';

class CompaniesGuideItem extends StatelessWidget {
  const CompaniesGuideItem({super.key, this.title, this.city, this.date, this.category, this.phone, this.email, this.publicOrPrivate, this.views, this.image});
  final String? title;
  final String? image;
  final String? city;
  final String? date;
  final String? category;
  final String? phone;
  final String? email;
  final String? publicOrPrivate;
  final String? views;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.primaryBoxDeocration(borderRadius: 10),
      // height: 230,
      child: IntrinsicHeight(
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
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
                            // runSpacing: 2,
                            children: [
                              SizedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Image(
                                      image: AssetImage(AppAssets.address),
                                      width: 20,
                                    ),
                                    const SizedBox(width: 5,),
                                    Text(
                                      city ?? "",
                                      maxLines: 1,
                                      style: AppStyles.autherSmall,
                                    ),
                                    
                                  ],
                                ),
                              ),
                              
                              SizedBox(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Image(
                                      image: AssetImage(AppAssets.calendar),
                                      width: 28,
                                    ),
                                    const SizedBox(width: 5,),
                                    Text(
                                      date ?? "",
                                      maxLines: 1,
                                      style: AppStyles.autherSmall,
                                    )
                                  ],
                                ),
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
                      CompaniesGuideAboutItem(
                        icon: const Icon(
                          Icons.phone,
                          color: activeColor,
                        ), 
                        text: phone
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: activeColor,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      CompaniesGuideAboutItem(
                        icon: const Icon(
                          Icons.email_sharp,
                          color: activeColor,
                        ), 
                        text: email
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: activeColor,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      CompaniesGuideAboutItem(
                        icon: const Icon(
                          Icons.info_outlined,
                          color: activeColor,
                        ), 
                        text: publicOrPrivate
                      ),
                      Container(
                        height: 50,
                        width: 1,
                        color: activeColor,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      CompaniesGuideAboutItem(
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: activeColor,
                        ), 
                        text: views
                      ),
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}