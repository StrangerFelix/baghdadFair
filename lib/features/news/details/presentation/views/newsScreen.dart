import 'package:baghdad_fair/core/components/screenAppBar.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/news/news/data/models/newsModel.dart';
import 'package:baghdad_fair/features/news/details/presentation/views/widgets/newsDetailsBody.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({required this.news,super.key});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackgroundColor,
      appBar: screenAppBar,
      body: NewsDetailsBody(news: news),
    );
  }
}