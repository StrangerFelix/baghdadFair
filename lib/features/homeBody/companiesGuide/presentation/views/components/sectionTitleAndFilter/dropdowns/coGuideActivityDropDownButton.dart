import 'dart:math';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersBloc.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersEvents.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersStates.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CoGuideActivityDropDownButton extends StatefulWidget {
  const CoGuideActivityDropDownButton({super.key});

  @override
  State<CoGuideActivityDropDownButton> createState() => _CoGuideActivityDropDownButtonState();
}

class _CoGuideActivityDropDownButtonState extends State<CoGuideActivityDropDownButton> {
  
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
    coGuideDropdownActivityEntry = OverlayEntry(
      builder: (context) => PositionedDirectional(
          end: Intl.getCurrentLocale() == 'ar' ? offset.dx : null,
          start: Intl.getCurrentLocale() == 'en' ? offset.dx : null,
          // top: offset.dy / 3.2,
          top: 205,
          width: size.width,
          child: buildOverlay(context)),
    );
    overlay.insert(coGuideDropdownActivityEntry!);
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
                coGuideDropdownActivityEntry?.remove();
                coGuideDropdownActivityEntry = null;    
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
      S.of(context).activity,
      S.of(context).commodity_trade,
      S.of(context).trade_services,
      S.of(context).producing,
    ];
    return BlocBuilder<CoGuideFiltersBloc, CoGuideFiltersStates>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (coGuideDropdownActivityEntry == null) {
              showOverlay(context);
              context.read<CoGuideFiltersBloc>().add(SectionHideOverlaysEvent('activity'));
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
                    angle: coGuideDropdownActivityEntry != null ? pi : 0,
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

