import 'dart:math';
import 'package:baghdad_fair/core/components/customFilterButton.dart';
import 'package:baghdad_fair/core/components/customTextField.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/manager/filters/fairsFiltersBloc.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/manager/filters/fairsFiltersEvents.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/views/components/sectionTitleAndFilter/dropdowns/fairsConditionDropDownButton.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/views/components/sectionTitleAndFilter/dropdowns/fairsLocationsDropdownButton.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FairsSearchAndFiltering extends StatefulWidget {
  const FairsSearchAndFiltering({super.key});

  @override
  State<FairsSearchAndFiltering> createState() => _FairsSearchAndFilteringState();
}

class _FairsSearchAndFilteringState extends State<FairsSearchAndFiltering> {
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: GestureDetector(
        onTap: !isExpanded ? () {
          setState(() {
            isExpanded = true;
            context.read<FairsFiltersBloc>().add(SectionHideOverlaysEvent('all'));
          });
        } : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: isExpanded ? 145 : 37,
          decoration: AppStyles.filterBoxDecoration,
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: isExpanded ? () {
                    setState(() {
                      isExpanded = false;
                      context.read<FairsFiltersBloc>().add(SectionHideOverlaysEvent('all'));
                    });
                  } : null,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                      start: 30,
                      end: 15
                    ),
                    color: Colors.transparent,
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          S.of(context).search_and_filtering,
                          style: AppStyles.filterTitle,
                        ),
                        const Spacer(),
                        Transform.rotate(
                          angle: isExpanded ? pi : 0,
                          child: const Icon(
                            Icons.keyboard_arrow_down,
                            color: gradiant2,
                            size: 25,
                          )
                        )
                      ],
                    )
                  ),
                ),
                isExpanded 
                ?  SizedBox(
                  // height: 140,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  CustomTextField(
                                    hintText: S.of(context).governorate,
                                    height: 25,
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    child: FairsLocationsDropdownButton(),
                                  ),
                                ],
                              ),
                            )
                          ),
                          const Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FairsConditionDropDownButton(),
                                  SizedBox(height: 35,)
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Row(
                          children: [
                            const Spacer(),
                            CustomFilterButton(
                              text: S.of(context).search
                            ),
                            CustomFilterButton(
                              text: S.of(context).cancel_fair_filter
                            ),
                            const SizedBox(width: 10,)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
                : const SizedBox() 
              ],
            ),
          ),
        ),
      ),
    );
  }
}