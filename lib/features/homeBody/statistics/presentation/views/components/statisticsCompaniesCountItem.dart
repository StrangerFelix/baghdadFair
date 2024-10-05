import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:flutter/material.dart';

class StatisticsCompaniesCountItem extends StatelessWidget {
  const StatisticsCompaniesCountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: AppStyles.primaryBoxDeocration(hasBorRadius: false),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                'مجموع الدول المشاركة',
                style: AppStyles.bodySmall.copyWith(
                  color: primaryTextColor
                ),
              ),
            ),
            const Spacer(),
            const Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Text('85',style: AppStyles.bodySmall,)
            ),
          ],
        ),
      )
    );
  }
}