import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/data/repository/sponsoringRepo.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/manager/sponsors/sponsorsEvents.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/manager/sponsors/sponsorsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SponsorsBloc extends Bloc<SponsorsEvents,SponsorsStates> {
  final SponsoringRepository _sponsoringRepository;
  SponsorsBloc(this._sponsoringRepository) : super (SponsorsInitial()) {
    on<SponsorsEvents>((event,emit) async{
      if (event is GetSponsorsEvent) {
        emit(SponsorsLoading());
        var data = await _sponsoringRepository.getSponsors();
        data.fold(
          (failure) => emit(SponsorsFailure(failure.errorMessage)), 
          (model) => emit(SponsorsLoaded(model))
        );
      }
    });
  }
}