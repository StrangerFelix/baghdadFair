import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/data/models/aboutUsModel.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/data/repository/aboutUsRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AboutUsRepositoryImplementation implements AboutUsRepository {
  final ApiService apiService;
  AboutUsRepositoryImplementation(this.apiService);
  @override
  Future<Either<Failures,AboutUsModel>> getAboutUsContext() async{ 
    try {
      var response = await apiService.get(endpoint: 'aboutUs/');
      AboutUsModel model = AboutUsModel.fromJson(response);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

}