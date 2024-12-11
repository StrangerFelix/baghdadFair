import 'dart:math';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/presentation/manager/filters/fairsFiltersBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/presentation/manager/filters/fairsFiltersEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/presentation/manager/filters/fairsFiltersStates.dart';


import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FairsConditionDropDownButton extends StatefulWidget {
  const FairsConditionDropDownButton({super.key});

  @override
  State<FairsConditionDropDownButton> createState() => _FairsConditionDropDownButtonState();
}

class _FairsConditionDropDownButtonState extends State<FairsConditionDropDownButton> {
  
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
    fairsDropdownConditionEntry = OverlayEntry(
      builder: (context) => PositionedDirectional(
          end: Intl.getCurrentLocale() == 'ar' ? offset.dx : null,
          start: Intl.getCurrentLocale() == 'en' ? offset.dx : null,
          // top: offset.dy / 3.2,
          top: 134,
          width: size.width,
          child: buildOverlay(context)),
    );
    overlay.insert(fairsDropdownConditionEntry!);
  }

  Widget buildOverlay(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: AppStyles.filterBoxDecoration.copyWith(
          border: Border.all(width: 1,color: gradiant2)
        ),
        child: Column(
            children: List.generate(items.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                fairsDropdownConditionEntry?.remove();
                fairsDropdownConditionEntry = null;    
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
                          color: gradiant2)
                        ,
                    ),
                  ),
                  index == items.length - 1
                      ? const Divider(
                          height: 0,
                          color: Colors.white,
                        )
                      : const Divider(
                          color: gradiant2,
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
      S.of(context).condition,
      S.of(context).ended,
      S.of(context).ongoing,
      S.of(context).soon,
    ];
    return BlocBuilder<FairsFiltersBloc, FairsFiltersStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (fairsDropdownConditionEntry == null) {
              showOverlay(context);
              context.read<FairsFiltersBloc>().add(SectionHideOverlaysEvent('condition'));
            } else {
              context.read<FairsFiltersBloc>().add(SectionHideOverlaysEvent('all'));
            }
          },
          child: Container(
            height: 25,
            decoration: AppStyles.filterBoxDecoration.copyWith(
              border: Border.all(
                width: 1,
                color: gradiant2,
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
                      color: gradiant2
                    ),
                  ),
                  const Spacer(),
                  Transform.rotate(
                    angle: fairsDropdownConditionEntry != null ? pi : 0,
                    child: const Icon(
                      Icons.arrow_drop_down_sharp,
                      
                      color: gradiant2,
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

