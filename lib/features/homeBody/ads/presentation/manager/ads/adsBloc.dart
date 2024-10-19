import 'package:baghdad_fair/features/homeBody/ads/data/repository/adsRepo.dart';
import 'package:baghdad_fair/features/homeBody/ads/presentation/manager/ads/adsEvents.dart';
import 'package:baghdad_fair/features/homeBody/ads/presentation/manager/ads/adsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsBloc extends Bloc<AdsEvents,AdsStates> {
  final AdsRepository _adsRepository;
  AdsBloc (this._adsRepository) : super (AdsInitial()) {
    on<AdsEvents>((event,emit) async{
      if (event is GetAdsEvent) {
        if (event.isPagination) {
          emit (AdsPaginationLoading());
        } else {
          emit (AdsLoading());
        }
        var data = await _adsRepository.getAds(filter: event.filter,page: event.page);
        data.fold(
          (failure) => emit(AdsFailure(failure.errorMessage)),
          (model) => emit(AdsLoaded(model))
        );
      }
    });
  }
}