import 'package:baghdad_fair/features/baghdadFair/aboutUs/data/repository/aboutUsRepo.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/presentation/manager/aboutUs/aboutUsEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/presentation/manager/aboutUs/aboutUsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutUsBloc extends Bloc<AboutUsEvents,AboutUsStates> {
  final AboutUsRepository _aboutUsRepository;
  AboutUsBloc(this._aboutUsRepository) : super (AboutUsInitial()) {
    on<AboutUsEvents>((event,emit) async{
      if (event is GetAboutUsEvent) {
        emit(AboutUsLoading());
        var data = await _aboutUsRepository.getAboutUsContext();
        data.fold(
          (failure) {
            emit(AboutUsFailure(failure.errorMessage));
          }, (model) {
            emit(AboutUsLoaded(model));
          }
        );
      }
    });
  }
}