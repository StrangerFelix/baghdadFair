import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/data/models/videosModel.dart';
import 'package:dartz/dartz.dart';

abstract class VideosRepository {
  Future<Either<Failures,VideosModel>> getVideos({
    required String filter,
    int page = 1,
  });
}