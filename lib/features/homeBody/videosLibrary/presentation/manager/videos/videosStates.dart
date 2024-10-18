import 'package:baghdad_fair/features/homeBody/videosLibrary/data/models/videosModel.dart';

abstract class VideosStates {}
class VideosInitial extends VideosStates {}

class VideosLoading extends VideosStates {}
class VideosPaginationLoading extends VideosStates {}
class VideosLoaded extends VideosStates {
  final VideosModel? model;
  VideosLoaded(this.model);
}
class VideosFailure extends VideosStates {
  final String error;
  VideosFailure(this.error);
}