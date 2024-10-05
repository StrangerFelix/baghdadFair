import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/views/components/newsCardsList.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/views/components/newsSectionTitle.dart';
import 'package:flutter/material.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        NewsSectionTitle(),
        CustomSearchBar(),
        NewsCardsList(),
      ],
    );
  }
}