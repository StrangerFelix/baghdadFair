import 'package:baghdad_fair/features/homeBody/statistics/presentation/views/components/statisticsCompaniesCountItem.dart';
import 'package:flutter/material.dart';

class StatisticsCountriesCount extends StatelessWidget {
  const StatisticsCountriesCount({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 85,
      child: Row(
        children: [
          StatisticsCompaniesCountItem(),
          SizedBox(width: 10,),
          StatisticsCompaniesCountItem(),
          SizedBox(width: 10,),
          StatisticsCompaniesCountItem(),
        ],
      ),
    );
  }
}