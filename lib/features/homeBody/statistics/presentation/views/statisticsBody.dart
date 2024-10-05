import 'package:baghdad_fair/features/homeBody/statistics/presentation/views/components/statisticsCompaniesCount.dart';
import 'package:baghdad_fair/features/homeBody/statistics/presentation/views/components/statisticsSectionTitle.dart';
import 'package:flutter/material.dart';

class StatisticsBody extends StatefulWidget {
  const StatisticsBody({super.key});

  @override
  State<StatisticsBody> createState() => _StatisticsBodyState();
}

class _StatisticsBodyState extends State<StatisticsBody> {
  bool isStreched = false;
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StatisticsSectionTitle(),
        StatisticsCountriesCount(),
        SizedBox(height: 50,)
      ],
    );
  }
}