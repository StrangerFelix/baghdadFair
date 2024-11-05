import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/homeBody/home/data/models/homeModel.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class MainShowTimeInfo extends StatelessWidget {
  const MainShowTimeInfo({this.data,super.key});
  final HomeData? data;
  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            gradient: const LinearGradient(
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
              colors: [
                Color(0xFF529AD8),
                Color(0xFF90CDFB),
                Color(0xFFD1BDF2),
              ]
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                S.of(context).show_days_and_hours,
                style: AppStyles.gradientBoxTextStyle,
              ),
              Text(
                '${S.of(context).from} ${data!.fromDate} ${S.of(context).to.toLowerCase()} ${data!.toDate}',
                style: AppStyles.gradientBoxTextStyle
              ),
              Text(
                '${S.of(context).from_hour} ${data!.fromHour} ${S.of(context).to_hour} ${data!.toHour}',
                style: AppStyles.gradientBoxTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
