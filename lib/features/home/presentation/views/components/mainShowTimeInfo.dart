import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/home/data/models/homeModel.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainShowTimeInfo extends StatelessWidget {
  const MainShowTimeInfo({this.data,super.key});
  final HomeData? data;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: AppStyles.boxShadow
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              S.of(context).show_days_and_hours,
              style: AppStyles.gradientBoxTextStyle,
            ),
            const SizedBox(height: 5,),
            Text(
              '${S.of(context).from} ${data!.fromDate} ${S.of(context).to.toLowerCase()} ${data!.toDate}',
              style: AppStyles.gradientBoxTextStyle
            ),
            const SizedBox(height: 5,),
            Text(
              '${S.of(context).from_hour} ${data!.fromHour} ${S.of(context).to_hour} ${data!.toHour}',
              style: AppStyles.gradientBoxTextStyle,
            ),
            // const SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
