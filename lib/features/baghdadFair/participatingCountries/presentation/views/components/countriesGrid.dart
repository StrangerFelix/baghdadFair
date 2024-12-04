import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/data/models/countriesModel.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/manager/countries/countriesBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/manager/countries/countriesStates.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/views/components/countriesItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesGrid extends StatefulWidget {
  const CountriesGrid({super.key});

  @override
  State<CountriesGrid> createState() => _CountriesGridState();
}

class _CountriesGridState extends State<CountriesGrid> {
  List<Country> countries = [];
  String? error;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesBloc, CountriesStates>(
      builder: (context, state) {
        if (state is CountriesLoaded) {
          countries = [];
          for (var item in state.model.data!.response!) {
            countries.add(item);
          }
        }
        if (state is CountriesFailure) {
          error = state.error;
        }
        return SizedBox(
          child: state is! CountriesLoading ? 
            state is! CountriesFailure ? 
            countries.isNotEmpty ?
            GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return CountriesItem(
                  countryName: countries[index].name,
                  countryFlag: countries[index].flag,
                );
              },
            ) : const CustomEmptyWidget()
            : CustomErrorWidget(error: error,)
            : const CustomLoadingWidget()
        );
      },
    );
  }
}
