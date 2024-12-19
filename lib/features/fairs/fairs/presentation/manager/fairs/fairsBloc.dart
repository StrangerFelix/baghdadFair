import 'package:baghdad_fair/features/fairs/fairs/data/repository/fairsRepo.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/manager/fairs/fairsEvents.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/manager/fairs/fairsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FairsBloc extends Bloc<FairsEvents,FairsStates> {
  final FairsRepository _fairsRepository;
  FairsBloc(this._fairsRepository) : super (FairsInitial()) {
    on<FairsEvents>((event,emit) async{
      if (event is GetFairsEvent) {
        if (event.isPagination) {
          emit(FairsPaginationLoading());
        } else {
          emit(FairsLoading());
        }
        var data = await _fairsRepository.getFairs(
          filter: event.filter,
          page: event.page,
        );
        data.fold(
          (failure) => emit(FairsFailure(failure.errorMessage)),
          (model) => emit(FairsLoaded(model)) 
        );
      }
    });
  }
}