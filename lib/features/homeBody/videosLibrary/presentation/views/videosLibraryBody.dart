import 'package:baghdad_fair/core/components/customSearchBar.dart';
import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/presentation/views/components/videosList.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

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
        const CustomSearchBar(),
        const VideosList()
      ],
    );
  }
}