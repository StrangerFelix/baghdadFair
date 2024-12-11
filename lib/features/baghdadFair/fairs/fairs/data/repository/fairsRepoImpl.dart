import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/data/models/fairsModel.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/data/repository/fairsRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FairsRepositoryImplementation implements FairsRepository {
  final ApiService _apiService;
  FairsRepositoryImplementation(this._apiService);
  @override
  Future<Either<Failures, FairsModel>> getFairs({
    required String filter,
    int page = 1,
  }) async{
    try {
      var data = await _apiService.get(endpoint: 'fairs?$filter&limit=${_apiService.limit}&page=$page');
      FairsModel model = FairsModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}