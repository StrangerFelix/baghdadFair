import 'package:baghdad_fair/core/components/customCachedImage.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/news/news/data/models/newsModel.dart';
import 'package:flutter/material.dart';

class NewsDetailsBody extends StatelessWidget {
  const NewsDetailsBody({required this.news,super.key});
  final News? news;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return  SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              maxWidth: 600
            ),
            child: Column(
              children: [
                CustomCachedImage(news!.photo),
                const SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  decoration: AppStyles.titleBoxDexoration,
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
                    vertical: 10
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
        );
      },
    );
  }
}