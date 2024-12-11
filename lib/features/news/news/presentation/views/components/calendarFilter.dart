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
  DateTime? _selectedFromDate;
  DateTime? _selectedToDate;

  Future<void> _selectFromDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: AppStyles.showTimePickerThemeBuilder,
      context: context,
      initialDate: _selectedFromDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedFromDate) {
      setState(() {
        _selectedFromDate = picked;

        // Check if To date is before From date and reset if necessary
        if (_selectedToDate != null && picked.isAfter(_selectedToDate!)) {
          _selectedToDate = null; // Reset To date
        }
      });
    }
  }

  Future<void> _selectToDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: AppStyles.showTimePickerThemeBuilder,
      context: context,
      initialDate: _selectedToDate ?? DateTime.now(),
      firstDate: _selectedFromDate ?? DateTime(2000), // Limit To date selection to be after From date
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedToDate) {
      setState(() {
        _selectedToDate = picked;
      });
    }
  }
  String dateFormat(DateTime date) {    
    if (date.year == DateTime.now().year) {
      return DateFormat('MMMM , dd').format(date);
    } else {
      return DateFormat.yMMMd().format(date);
    }
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
                const SizedBox(width: 10,),
                const Image(image: AssetImage(AppAssets.calendar)),
                const SizedBox(width: 10,),
                Text(
                  S.of(context).filter_by_date,
                  style: AppStyles.bodySmall.copyWith(fontSize: 14,fontWeight: FontWeight.normal),
                ),
                const Spacer(),
                CustomFilterButton(
                  text: S.of(context).search,
                  onTap: () {
                    // print ("from: $_selectedFromDate \nTo: $_selectedToDate");
                  },
                ),
                const SizedBox(width: 5,),
              ],
            ),
          ),
          const Divider(height: 1,color: gradiant2,),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectFromDate(context),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                      decoration: AppStyles.filterBoxDecoration,
                      child: Center(
                        child: Text(
                          _selectedFromDate != null
                          ? dateFormat(_selectedFromDate!)
                          : S.of(context).from,
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
                    onTap: () => _selectToDate(context),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                      decoration: AppStyles.filterBoxDecoration,
                      child: Center(
                        child: Text(
                          _selectedToDate != null
                        ? dateFormat(_selectedToDate!)
                        : S.of(context).to,
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