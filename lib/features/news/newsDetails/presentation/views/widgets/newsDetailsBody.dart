import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/news/news/data/models/newsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class NewsDetailsBody extends StatelessWidget {
  const NewsDetailsBody({required this.news,super.key});
  final News? news;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return  Stack(
          children: [
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight
                  ),
                  child: Column(
                    children: [
                      CustomCachedImage(news!.photo),
                      // const SizedBox(height: 10,),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              
                              
                              gradiant1.withOpacity(.05),
                              gradiant2.withOpacity(.2),
                              gradiant2.withOpacity(.3)
                            ]
                          )
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: horizontalPadding / 1.5
                        ),
                        child: Text(
                          news!.title!,
                          style: AppStyles.bodySmall.copyWith(fontSize: 18,fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding / 1.5,
                          vertical: 20
                        ),
                        child: Text(
                          news!.description!,
                          textAlign: TextAlign.justify,
                          style: AppStyles.bodySmall.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 50,)
                    ],
                  ),
                ),
              ),
            ),
            PositionedDirectional(
              start: horizontalPadding,
              top: MediaQuery.of(context).padding.top,
              child: GestureDetector(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.pop();
                },
                child: CircleAvatar(
                  backgroundColor: primaryBackgroundColor.withOpacity(.65),
                  radius: 24,
                  child: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              )
            )
          ],
        );
      },
    );
  }
}