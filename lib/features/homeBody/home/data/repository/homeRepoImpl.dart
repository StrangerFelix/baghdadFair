import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/home/data/repository/homeRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImplementation implements HomeRepository {
  HomeRepositoryImplementation(this._apiService);
  final ApiService _apiService;
  
  @override
  Future <Either<Failures,dynamic>> fetchHomeBody() async{
    try {
      var data = await _apiService.get(
        endpoint: 'home'
      );
      // print(data);
      return right(data);
    } on Exception catch (e) {
      if (e is DioException) {
        // print(ServerFailure.fromDioException(e).errorMessage);
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  sendReport() {
    
  }
}