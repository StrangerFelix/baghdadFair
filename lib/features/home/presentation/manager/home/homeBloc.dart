import 'package:baghdad_fair/features/home/data/repository/homeRepo.dart';
import 'package:baghdad_fair/features/home/presentation/manager/home/homeEvents.dart';
import 'package:baghdad_fair/features/home/presentation/manager/home/homeStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvents,HomeStates> {
  final HomeRepository _homeRepository;
  HomeBloc(this._homeRepository) : super (HomeInitial()) {
    on<HomeEvents>((event,emit) async{
      if (event is GetHomeDataEvent) {
        emit(HomeLoading());
        var data = await _homeRepository.getHomeBody();
        data.fold(
          (failure) => emit(HomeFailure(failure.errorMessage)), 
          (model) => emit(HomeLoaded(model))
        );
      }
    });
  }
}