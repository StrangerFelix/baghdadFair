import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/data/models/sponsoringModel.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/data/repository/sponsoringRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SponsoringRepositoryImplementation implements SponsoringRepository {
  final ApiService _apiService;
  SponsoringRepositoryImplementation(this._apiService);
  @override
  Future<Either<Failures, SponsorsModel>> getSponsors() async{
    try {
      var data = await _apiService.get(endpoint: 'sponsors');
      SponsorsModel model = SponsorsModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}