import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/data/repository/companiesRepo.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesBloc extends Bloc<CompaniesEvents,CompaniesStates> {
  final CompaniesRepository _companiesRepository;
  CompaniesBloc(this._companiesRepository) : super (CompaniesInitial()) {
    on<CompaniesEvents>((event,emit) async{
      if (event is GetCompaniesEvent) {
        if (event.isPagination) {
          emit(CompaniesPaginationLoading());
        } else {
          emit(CompaniesLoading());
        }
        var data = await _companiesRepository.getCompanies(
          filter: event.filter,
          page: event.page,
        );
        data.fold(
          (failure) => emit(CompaniesFailure(failure.errorMessage)),
          (model) => emit(CompaniesLoaded(model)) 
        );
      }
    });
  }
}