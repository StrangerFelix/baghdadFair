import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/news/news/data/models/newsModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    required this.news,
    super.key
  });
  final News? news;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.newsDetails,extra: news);
      },
      child: Container(
        height: 150,
        decoration: AppStyles.primaryBoxDeocration(borderRadius: 10),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: news!.photo != null && news!.photo != ""
                  ? NetworkImage(
                    news!.photo!
                  ) 
                  : null,
                  backgroundColor: Colors.white,
                ),
              )
            ),
            // Container(height: double.infinity,width: 1,color: Colors.grey.withOpacity(.5),),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        news!.title ?? "",
                        style: AppStyles.bodySmall,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  // const Spacer(),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10
                      ),
                      child: Text(
                        news!.description ?? "",
                        style: AppStyles.autherSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}