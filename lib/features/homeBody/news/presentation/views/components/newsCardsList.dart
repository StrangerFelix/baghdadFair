import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/core/utilities/pagesPagination.dart';
import 'package:baghdad_fair/features/homeBody/news/data/models/newsModel.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/manager/news/newsBloc.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/manager/news/newsStates.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/views/components/newsCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCardsList extends StatefulWidget {
  const NewsCardsList({super.key});

  @override
  State<NewsCardsList> createState() => _NewsCardsListState();
}

class _NewsCardsListState extends State<NewsCardsList> {
  List<News> news = [];
  int limitCounter = 0;
  String? error;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsStates>(
      builder: (context, state) {
        if (state is NewsLoading) {
          newsHasMore = true; // لان راح يترست
          news = []; // if refreshing {تكدر تحددها من تستدعي الايفينت تكله اذا باكنيشن او لا}
          newsPagination = 1;
        }
        if (state is NewsFailure) {
          error = state.error;
        }
        if (state is NewsLoaded) {
          for (var item in state.model!.data!.response!) {
            limitCounter++;
            news.add(item);
          }
          if (limitCounter < 6) { // 6 is the limit
            newsHasMore = false;
          }
          limitCounter = 0;
        }
        return SizedBox(
          child: state is! NewsLoading ?
            state is! NewsFailure ?
            news.isNotEmpty ?
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: news.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index < news.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 5),
                  child: NewsCard(
                    image: news[index].photo,
                    title: news[index].title,
                    auther: news[index].description,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: newsHasMore ? const CustomLoadingIndicator() : const SizedBox()
              );
            },
          ) : const CustomEmptyWidget()
            : CustomErrorWidget(error: error,)
            : const CustomLoadingWidget()
        );
      },
    );
  }
}
