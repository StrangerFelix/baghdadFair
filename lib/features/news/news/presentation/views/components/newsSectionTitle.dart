import 'package:baghdad_fair/core/components/sectionTitle.dart';
import 'package:baghdad_fair/core/components/sectionTitleButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/features/news/news/presentation/views/components/calendarFilter.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewsSectionTitle extends StatefulWidget {
  const NewsSectionTitle({super.key});

  @override
  State<NewsSectionTitle> createState() => _NewsSectionTitleState();
}

class _NewsSectionTitleState extends State<NewsSectionTitle> {
  bool isStreched = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: S.of(context).latest_news,
          button: SectionTitleButton(
            text: S.of(context).filter,
            icon: SvgPicture.asset(
              AppAssets.filter,width: 18,
            ),
            onTap: () {
              setState(() {
                isStreched = !isStreched;
              });
            },
          ),
        ),
        isStreched ?
          const CalendarFilter() 
          : const SizedBox(),
        SizedBox(height: isStreched ? 10 : 0,),
      ],
    );
  }
}