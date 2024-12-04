import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/core/utilities/pagesFilters.dart';
import 'package:baghdad_fair/features/videos/presentation/manager/videos/videosBloc.dart';
import 'package:baghdad_fair/features/videos/presentation/manager/videos/videosEvents.dart';
import 'package:baghdad_fair/features/videos/presentation/views/components/videosList.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosLibraryBody extends StatelessWidget {
  const VideosLibraryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(
          title: S.of(context).vid_library
        ),
        CustomSearchBar(
          onSubmitted: (val) {
            videosFilter = val == '' ? "" : 'search=$val';
            context.read<VideosBloc>().add(GetVideosEvent(filter: videosFilter));
          },
        ),
        const VideosList()
      ],
    );
  }
}