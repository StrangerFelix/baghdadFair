import 'package:baghdad_fair/features/homeBody/participatingCountries/data/repository/countriesRepo.dart';
import 'package:baghdad_fair/features/homeBody/participatingCountries/presentation/manager/countries/countriesEvents.dart';
import 'package:baghdad_fair/features/homeBody/participatingCountries/presentation/manager/countries/countriesStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesBloc extends Bloc<CountriesEvents,CountriesStates> {
  final CountriesRepository _countriesRepository;
  CountriesBloc(this._countriesRepository) : super (CountriesInitial()) {
    on<CountriesEvents>((event,emit) async{
      if (event is GetCountriesEvent) {
        emit(CountriesLoading());
        var data = await _countriesRepository.getCountries(filter: event.filter);
        data.fold(
          (failure) => emit(CountriesFailure(failure.errorMessage)), 
          (model) => emit(CountriesLoaded(model))
        );
      }
    });
  }
}