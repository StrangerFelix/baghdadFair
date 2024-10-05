import 'dart:math';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersBloc.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersEvents.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersStates.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CoGuideTypeDropdownButton extends StatefulWidget {
  const CoGuideTypeDropdownButton({super.key});

  @override
  State<CoGuideTypeDropdownButton> createState() => _CoGuideTypeDropdownButtonState();
}

class _CoGuideTypeDropdownButtonState extends State<CoGuideTypeDropdownButton> {
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
    coGuideDropdownTypeEntry = OverlayEntry(
      builder: (context) => PositionedDirectional(
          end: Intl.getCurrentLocale() == 'ar' ? offset.dx : null,
          start: Intl.getCurrentLocale() == 'en' ? offset.dx : null,
          // top: offset.dy / 3.2,
          top: 170,
          width: size.width,
          child: buildOverlay(context)),
    );
    overlay.insert(coGuideDropdownTypeEntry!);
  }

  Widget buildOverlay(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: AppStyles.filterBoxDecoration.copyWith(
          border: Border.all(width: 1,color: AppStyles.skyBlueColor)
        ),
        child: Column(
            children: List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                coGuideDropdownTypeEntry?.remove();
                coGuideDropdownTypeEntry = null;    
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
                          color: AppStyles.skyBlueColor,
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
      S.of(context).type,
      S.of(context).private,
      S.of(context).public,
      S.of(context).mixed
    ];
    return BlocBuilder<CoGuideFiltersBloc, CoGuideFiltersStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (coGuideDropdownTypeEntry == null) {
              showOverlay(context);
              context.read<CoGuideFiltersBloc>().add(SectionHideOverlaysEvent('type'));
            } else {
              context.read<CoGuideFiltersBloc>().add(SectionHideOverlaysEvent('all'));
            }
          },
          child: Container(
            height: 25,
            decoration: AppStyles.filterBoxDecoration.copyWith(
              border: Border.all(
                width: 1,
                color: AppStyles.skyBlueColor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 15,
                end: 5
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      items[currentIndex],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Color.fromARGB(255, 0, 45, 85)
                      ),
                    ),
                  ),
                  
                  Transform.rotate(
                    angle: coGuideDropdownTypeEntry != null ? pi : 0,
                    child: const Icon(
                      Icons.arrow_drop_down_sharp,
                      
                      color: Color.fromARGB(255, 0, 45, 85),
                    )
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}