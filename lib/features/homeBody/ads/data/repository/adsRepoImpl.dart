import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/ads/data/models/adsModel.dart';
import 'package:baghdad_fair/features/homeBody/ads/data/repository/adsRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AdsRepositoryImplementation implements AdsRepository {
  final ApiService _apiService;
  AdsRepositoryImplementation(this._apiService);
  @override
  Future<Either<Failures, AdsModel>> getAds({
    required String filter, 
    int page = 1
  }) async{
    try {
      var data = await _apiService.get(endpoint: 'ads?$filter&limit=${_apiService.limit}&page=$page');
      AdsModel model = AdsModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}