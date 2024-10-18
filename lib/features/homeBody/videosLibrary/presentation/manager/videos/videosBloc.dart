import 'package:baghdad_fair/features/homeBody/videosLibrary/data/repository/videosRepo.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/presentation/manager/videos/videosEvents.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/presentation/manager/videos/videosStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideosBloc extends Bloc<VideosEvents,VideosStates> {
  final VideosRepository _videosRepository;
  VideosBloc(this._videosRepository) : super (VideosInitial()) {
    on<VideosEvents>((event,emit) async {
      if (event is GetVideosEvent) {
        if (event.isPagination) {
          emit(VideosPaginationLoading());
        } else {
          emit(VideosLoading());
        }
        var data = await _videosRepository.getVideos(
          filter: event.filter,
          page: event.page
        );
        data.fold(
          (failure) => emit(VideosFailure(failure.errorMessage)), 
          (model) => emit(VideosLoaded(model))
        );
      }
    });
  }
}