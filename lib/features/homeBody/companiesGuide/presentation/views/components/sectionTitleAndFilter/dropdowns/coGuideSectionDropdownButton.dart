import 'dart:math';

import 'package:baghdad_fair/core/components/sectionTitleButton.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersBloc.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersEvents.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersStates.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CoGuideDropdownSectionButton extends StatefulWidget {
  const CoGuideDropdownSectionButton({super.key});
  @override
  State<CoGuideDropdownSectionButton> createState() =>
      _CoGuideDropdownSectionButtonState();
}

class _CoGuideDropdownSectionButtonState extends State<CoGuideDropdownSectionButton> {
  int currentIndex = 0;
  late List items;
  @override
  void initState() {
    super.initState();
  }

  void showOverlay(BuildContext context) {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);
    coGuideDropdownSectionEntry = OverlayEntry(
      builder: (context) => PositionedDirectional(
          end: Intl.getCurrentLocale() == 'ar' ? offset.dx : null,
          start: Intl.getCurrentLocale() == 'en' ? offset.dx : null,
          top: 55,
          width: size.width,
          child: buildOverlay(context)),
    );
    overlay.insert(coGuideDropdownSectionEntry!);
  }

  Widget buildOverlay(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: AppStyles.filterBoxDecoration,
        child: Column(
            children: List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                coGuideDropdownSectionEntry?.remove();
                coGuideDropdownSectionEntry = null;    
              });
            },
            child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      items[index],
                      style: const TextStyle(
                          height: 1.3,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 45, 85)),
                    ),
                  ),
                  index == items.length - 1
                      ? const Divider(
                          height: 0,
                          color: Colors.white,
                        )
                      : const Divider(
                          color: primaryTextColor,
                        )
                ],
              ),
            ),
          );
        })),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    items = [
      S.of(context).no_filter,
      S.of(context).newest,
      S.of(context).oldest,
      S.of(context).top_rated,
      S.of(context).low_rated
    ];
    return BlocBuilder<CoGuideFiltersBloc, CoGuideFiltersStates>(
      builder: (context, state) {
        return SectionTitleButton(
            text: items[currentIndex],
            icon: Transform.rotate(
                angle: coGuideDropdownSectionEntry != null ? pi : 0,
                child: const Icon(
                  Icons.arrow_drop_down_sharp,
                  color: Colors.white,
                )),
            onTap: () {
              setState(() {
                if (coGuideDropdownSectionEntry != null) {
                  context
                      .read<CoGuideFiltersBloc>()
                      .add(SectionHideOverlaysEvent('all'));
                } else {
                  context
                      .read<CoGuideFiltersBloc>()
                      .add(SectionHideOverlaysEvent('section'));
                  showOverlay(context);
                }
              });
            });
      },
    );
  }
}
