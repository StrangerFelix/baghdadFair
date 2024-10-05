import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/views/components/newsCard.dart';
import 'package:flutter/material.dart';

class NewsCardsList extends StatefulWidget {
  const NewsCardsList({super.key});

  @override
  State<NewsCardsList> createState() => _NewsCardsListState();
}

class _NewsCardsListState extends State<NewsCardsList> {
  final limit = 10;
  int page = 1;
  List news = [];
  final _controller = ScrollController();
  final itemCount = 3;
  @override
  void initState() {
    _controller.addListener(() {
      if (_controller.position.maxScrollExtent == _controller.offset) {
        // use the bloc event
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      controller: _controller,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount + 1,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        if (index < itemCount) {
          return const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: 5
            ),
            child: NewsCard(
              image: 'https://imhussain.com/upload/orginal/65018cd847292.jpg',
              title: 'تطبيق برنامج الاعتراف المتبادل بشهادات المطابقة بين الجهاز المركزي للتقييس والسيطرة النوعية',
              auther: 'تطبيق برنامج متبادل بين العراق والسعودية',
            ),
          );
        }
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child:  CustomLoadingIndicator()
        );
      },
    );
  }
}