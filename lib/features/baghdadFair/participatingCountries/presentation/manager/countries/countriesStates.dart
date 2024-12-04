import 'package:baghdad_fair/features/baghdadFair/participatingCountries/data/models/countriesModel.dart';

abstract class CountriesStates {}
class CountriesInitial extends CountriesStates {}

class CountriesLoading extends CountriesStates {}
class CountriesLoaded extends CountriesStates {
  final CountriesModel model;
  CountriesLoaded(this.model);
}
class CountriesFailure extends CountriesStates {
  final String error;
  CountriesFailure(this.error);
}