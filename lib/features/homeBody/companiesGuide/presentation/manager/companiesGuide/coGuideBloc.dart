import 'package:baghdad_fair/features/homeBody/companiesGuide/data/repository/coGuideRepo.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/companiesGuide/coGuideEvents.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/companiesGuide/coGuideStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompaniesGuideBloc extends Bloc<CompaniesGuideEvents,CompaniesGuideStates> {
  final CompaniesGuideRepository _companiesGuideRepository;
  CompaniesGuideBloc(this._companiesGuideRepository) : super (CompaniesGuideInitial()) {
    on<CompaniesGuideEvents>((event,emit) async{
      if (event is GetCompaniesGuideEvent) {
        if (event.isPagination) {
          emit(CompaniesGuidePaginationLoading());
        } else {
          emit(CompaniesGuideLoading());
        }
        var data = await _companiesGuideRepository.getCompanies(
          filter: event.filter,
          page: event.page
        );
        data.fold(
          (failure) => emit(CompaniesGuideFailure(failure.errorMessage)), 
          (model) => emit(CompaniesGuideLoaded(model))
        );
      }
    });
  }
}