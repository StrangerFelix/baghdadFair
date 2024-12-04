import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/data/models/countriesModel.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/data/repository/countriesRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CountriesRepositoryImplementation implements CountriesRepository {
  final ApiService _apiService;
  CountriesRepositoryImplementation(this._apiService);
  @override
  Future<Either<Failures, CountriesModel>> getCountries({
    required String filter, 
  }) async{
    try {
      var data = await _apiService.get(endpoint: 'countries?$filter');
      CountriesModel model = CountriesModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}