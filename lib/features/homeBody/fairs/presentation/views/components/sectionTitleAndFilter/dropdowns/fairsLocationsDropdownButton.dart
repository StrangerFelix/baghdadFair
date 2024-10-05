import 'dart:math';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/manager/filters/fairsFiltersBloc.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/manager/filters/fairsFiltersEvents.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/manager/filters/fairsFiltersStates.dart';

import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FairsLocationsDropdownButton extends StatefulWidget {
  const FairsLocationsDropdownButton({super.key});

  @override
  State<FairsLocationsDropdownButton> createState() => _FairsLocationsDropdownButtonState();
}

class _FairsLocationsDropdownButtonState extends State<FairsLocationsDropdownButton> {
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
    fairsDropdownLocationsEntry = OverlayEntry(
      builder: (context) => PositionedDirectional(
          end: Intl.getCurrentLocale() == 'ar' ? offset.dx : null,
          start: Intl.getCurrentLocale() == 'en' ? offset.dx : null,
          // top: offset.dy / 3.2,
          top: 205,
          width: size.width,
          child: buildOverlay(context)),
    );
    overlay.insert(fairsDropdownLocationsEntry!);
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
                fairsDropdownLocationsEntry?.remove();
                fairsDropdownLocationsEntry = null;    
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
      S.of(context).all_locations,
      S.of(context).inside_iraq,
      S.of(context).outside_iraq
    ];
    return BlocBuilder<FairsFiltersBloc, FairsFiltersStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (fairsDropdownLocationsEntry == null) {
              showOverlay(context);
              context.read<FairsFiltersBloc>().add(SectionHideOverlaysEvent('locations'));
            } else {
              context.read<FairsFiltersBloc>().add(SectionHideOverlaysEvent('all'));
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
                  Text(
                    items[currentIndex],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color.fromARGB(255, 0, 45, 85)
                    ),
                  ),
                  const Spacer(),
                  Transform.rotate(
                    angle: fairsDropdownConditionEntry != null ? pi : 0,
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