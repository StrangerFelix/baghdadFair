import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/components/custumButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    this.image,
    this.title,
    this.auther,
    this.date,
    this.category,
    this.link,
    super.key
  });
  final String? image;
  final String? title;
  final String? auther;
  final String? date;
  final String? category;
  final String? link;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: AppStyles.primaryBoxDeocration(hasBorRadius: true),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF3EA9F9).withOpacity(.6),
                  borderRadius: const BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    bottomStart: Radius.circular(20),
                  ),
                ),
                
              ),
            ),
             Expanded(
              flex: 30,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 10,
                  vertical: 10
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: AspectRatio(
                        aspectRatio: 3/2,
                        child: CustomCachedImage(image),
                      )
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      flex: 6,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 5),
                                child: Text(
                                  title ?? "",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.bodySmall,
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Row(
                                children: [
                                  const Image(
                                    
                                    image: AssetImage(AppAssets.user),
                                    height: 30,
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(
                                    auther ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.autherSmall,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(AppAssets.calendar),
                                    width: 30,
                                  ),
                                  const SizedBox(width: 5,),
                                  Text(
                                    date ?? "",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppStyles.autherSmall,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(start: 5),
                                child: Text(
                                  category ?? "",
                                  style: AppStyles.autherSmall,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(height: 30,),
                            ],
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: CustomButton(
                              onPressed: () {
                                // link to youtube
                              }, 
                              text: S.of(context).show_video,
                              color: Colors.grey[200],
                              textStyle: AppStyles.bodySmall.copyWith(fontSize: 14),
                              vpadding: 5,
                              hpadding: 15,
                            )
                          )
                        ],
                      )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}