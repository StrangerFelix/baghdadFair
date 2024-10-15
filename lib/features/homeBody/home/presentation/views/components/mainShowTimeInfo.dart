import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/homeBody/home/data/models/homeModel.dart';
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
      child: Container(
        height: 120,
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
            const Text(
              'أيام وساعات العرض',
              style: AppStyles.gradientBoxTextStyle,
            ),
            Text(
              'من ${data!.fromDate} الى ${data!.toDate}',
              style: AppStyles.gradientBoxTextStyle
            ),
            Text(
              'من الساعة ${data!.fromHour} الى الساعة ${data!.toHour}',
              style: AppStyles.gradientBoxTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
