import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    this.image,
    this.title,
    this.auther,
    super.key
  });
  final String? image;
  final String? title;
  final String? auther;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: AppStyles.primaryBoxDeocration(borderRadius: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: image != null && image != ""
                ? NetworkImage(
                  image!
                ) 
                : null,
                backgroundColor: Colors.white,
              ),
            )
          ),
          Container(height: double.infinity,width: 1,color: Colors.grey.withOpacity(.5),),
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
                      title ?? "",
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
                      auther ?? "",
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
    );
  }
}