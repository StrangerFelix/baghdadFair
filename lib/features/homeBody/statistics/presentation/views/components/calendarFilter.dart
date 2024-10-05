import 'dart:math';

import 'package:baghdad_fair/core/components/customFilterButton.dart';
import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarFilter extends StatefulWidget {
  const CalendarFilter({super.key});

  @override
  State<CalendarFilter> createState() => _CalendarFilterState();
}

class _CalendarFilterState extends State<CalendarFilter> {

  int? fromYear;
  int? toYear;
  final int currentYear = DateTime.now().year;

  // Function to pick the year
  Future<void> _pickYear(BuildContext context, bool isFrom) async {
    int initialYear = isFrom ? fromYear ?? currentYear : toYear ?? currentYear;

    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          
          child: Container(
            color: primaryBackgroundColor,
            height: 500,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: primaryTextColor,
                  onPrimaryContainer: primaryTextColor,
                  onPrimary: primaryBackgroundColor,
                  onSecondary: primaryTextColor,
                  surface: primaryBackgroundColor,
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: primaryTextColor,
                  ),
                ),
                dividerTheme: DividerThemeData(
                  color: Colors.grey.withOpacity(.5)
                )
              ),
              child: YearPicker(
                firstDate: DateTime(2000),
                lastDate: DateTime(currentYear),
                selectedDate: DateTime(initialYear),
                onChanged: (DateTime pickedYear) {
                  setState(() {
                    if (isFrom) {
                      fromYear = pickedYear.year;
                      // Ensure fromYear is not greater than toYear
                      if (toYear != null && fromYear! > toYear!) {
                        toYear = fromYear;
                      }
                    } else {
                      toYear = pickedYear.year;
                      // Ensure toYear is not less than fromYear
                      if (fromYear != null && toYear! < fromYear!) {
                        fromYear = toYear;
                      }
                    }
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 95,
      margin: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: AppStyles.filterBoxDecoration,
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: Row(
              children: [
                const Image(image: AssetImage(AppAssets.calendar)),
                Text(
                  S.of(context).filter_by_year,
                  style: AppStyles.bodySmall.copyWith(fontSize: 14),
                ),
                const Spacer(),
                CustomFilterButton(
                  text: S.of(context).search,
                  onTap: () {
                    // print ("from: $_selectedFromDate \nTo: $_selectedToDate");
                  },
                )
              ],
            ),
          ),
          const Divider(height: 1,color: primaryTextColor,),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _pickYear(context, true);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                      decoration: AppStyles.filterBoxDecoration,
                      child: Center(
                        child: Text(
                          fromYear != null ? fromYear.toString() : S.of(context).from,
                          style: AppStyles.selectionFilterText,
                        ),
                      ),
                    ),
                  )
                ),
                Transform.rotate(
                  angle: Intl.getCurrentLocale() == "en" ? pi : 0,
                  child: const Image(
                    image: AssetImage(AppAssets.arrow)
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _pickYear(context, false);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                      decoration: AppStyles.filterBoxDecoration,
                      child: Center(
                        child: Text(
                          toYear != null ? toYear.toString() : S.of(context).to,
                        style: AppStyles.selectionFilterText,
                        ),
                      ),
                    ),
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}