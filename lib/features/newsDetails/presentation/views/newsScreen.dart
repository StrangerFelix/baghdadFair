import 'package:baghdad_fair/features/homeBody/news/data/models/newsModel.dart';
import 'package:baghdad_fair/features/newsDetails/presentation/views/widgets/newsDetailsBody.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({required this.news,super.key});
  final News news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsDetailsBody(news: news),
    );
  }
}