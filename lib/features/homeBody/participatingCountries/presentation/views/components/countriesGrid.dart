import 'package:baghdad_fair/features/homeBody/participatingCountries/presentation/views/components/countriesItem.dart';
import 'package:flutter/material.dart';

class CountriesGrid extends StatelessWidget {
  const CountriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CountriesItem(
          countryName: 'العراق',
          countryFlag: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjUnNRyR37pozOXAVILPnNtA7CrX_q9HnL6Q&s',
        );
      },
    );
  }
}