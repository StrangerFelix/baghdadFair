import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/data/models/companiesGuideModel.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/data/repository/coGuideRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CompaniesGuideRepositoryImplementation implements CompaniesGuideRepository {
  final ApiService _apiService;
  CompaniesGuideRepositoryImplementation(this._apiService);
  @override
  Future<Either<Failures, CompaniesGuideModel>> getCompanies({
    required String filter, 
    int page = 1
  }) async{
    try {
      var data = await _apiService.get(endpoint: 'companydetails?$filter&limit=${_apiService.limit}&page=$page');
      CompaniesGuideModel model = CompaniesGuideModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}