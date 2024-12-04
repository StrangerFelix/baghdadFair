import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/data/models/companiesModel.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/data/repository/companiesRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CompaniesRepositoryImplementation implements CompaniesRepository {
  final ApiService _apiService;
  CompaniesRepositoryImplementation(this._apiService);

   @override
  Future<Either<Failures, CompaniesModel>> getCompanies({
    required String filter,
    int page = 1,
  }) async{
    try {
      var data = await _apiService.get(endpoint: 'companies?$filter&limit=${_apiService.limit}&page=$page');
      CompaniesModel model = CompaniesModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}