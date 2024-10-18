import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/data/models/videosModel.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/data/repository/videosRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class VideosRepositoryImplementation implements VideosRepository {
  final ApiService _apiService;
  VideosRepositoryImplementation(this._apiService);
  @override
  Future<Either<Failures, VideosModel>> getVideos({
    required String filter, 
    int page = 1
  }) async{
    try {
      var data = await _apiService.get(endpoint: 'videos?$filter&limit=${_apiService.limit}&page=$page');
      VideosModel model = VideosModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
    
}

