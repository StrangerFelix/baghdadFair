import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/home/data/models/homeModel.dart';
import 'package:baghdad_fair/features/homeBody/home/data/repository/homeRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class HomeRepositoryImplementation implements HomeRepository {
  HomeRepositoryImplementation(this._apiService);
  final ApiService _apiService;
  
  @override
  Future <Either<Failures,HomeModel>> getHomeBody() async{
    try {
      var data = await _apiService.get(
        endpoint: 'home'
      );
      HomeModel? model = HomeModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        // print(ServerFailure.fromDioException(e).errorMessage);
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failures, String>> sendReport({
    required String name,
    required String email,
    required String subject,
    required String message

  }) async{
    try {
      await _apiService.post(
        endpoint: 'contactUs',
        data: {
          "name" : name, 
          "email" : email,
          "subject" : subject,
          "message" : message
        }
      );
      return right(
        Intl.getCurrentLocale() == 'ar' ? "تم ارسال البريد" : "Email sent successfully"
      );
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  
}