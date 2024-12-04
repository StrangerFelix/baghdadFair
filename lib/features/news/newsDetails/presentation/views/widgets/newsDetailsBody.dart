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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: horizontalPadding / 2
                        ),
                        child: Text(
                          news!.title!,
                          style: AppStyles.titleSmall.copyWith(color: Colors.black),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: horizontalPadding / 2
                        ),
                        child: Text(
                          news!.description!,
                          style: AppStyles.autherSmall.copyWith(fontWeight: FontWeight.w500),
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
                child: const CircleAvatar(
                  backgroundColor: primaryBackgroundColor,
                  radius: 24,
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              )
            )
          ],
        );
      },
    );
  }
}