import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/utilities/pagesFilters.dart';
import 'package:baghdad_fair/features/news/news/presentation/manager/news/newsBloc.dart';
import 'package:baghdad_fair/features/news/news/presentation/manager/news/newsEvents.dart';
import 'package:baghdad_fair/features/news/news/presentation/views/components/newsCardsList.dart';
import 'package:baghdad_fair/features/news/news/presentation/views/components/newsSectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const NewsSectionTitle(),
        CustomSearchBar(
          onSubmitted: (val) {
            newsFilter = val == '' ? "" : 'search=$val';
            context.read<NewsBloc>().add(GetNewsEvent(filter: videosFilter));
          },
        ),
        const NewsCardsList(),
      ],
    );
  }
}