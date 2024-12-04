import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/utilities/pagesPagination.dart';
import 'package:baghdad_fair/features/videos/data/models/videosModel.dart';
import 'package:baghdad_fair/features/videos/presentation/manager/videos/videosBloc.dart';
import 'package:baghdad_fair/features/videos/presentation/manager/videos/videosStates.dart';
import 'package:baghdad_fair/features/videos/presentation/views/components/videoCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosList extends StatefulWidget {
  const VideosList({super.key});

  @override
  State<VideosList> createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> {
  List<Video> videos = [];
  String? error;
  int limitCounter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosStates>(
      builder: (context, state) {
        if (state is VideosLoading) {
          videosHasMore = true; // لان راح يترست
          videos = []; // if refreshing {تكدر تحددها من تستدعي الايفينت تكله اذا باكنيشن او لا}
          videosPagination = 1;
        }
        if (state is VideosFailure) {
          error = state.error;
        }
        if (state is VideosLoaded) {
          for (var item in state.model!.data!.response!) {
            limitCounter++;
            videos.add(item);
          }
          if (limitCounter < 6) { // 6 is the limit
            videosHasMore = false;
          }
          limitCounter = 0;
        }
        return SizedBox(
          child: state is! VideosLoading ?
            state is! VideosFailure ?
            videos.isNotEmpty ?
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: videos.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index < videos.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: VideoCard(
                    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTY70aj8rN_VdbZpVuwtQx7I9dj4JCWQS4w2g&s',
                    title: videos[index].title,
                    auther: videos[index].description,
                    date: videos[index].createdAt!.substring(0,10),
                    category: videos[index].classification,
                    link: videos[index].link,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: videosHasMore ? const CustomLoadingIndicator() : const SizedBox()
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
