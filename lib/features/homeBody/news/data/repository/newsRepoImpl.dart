import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/news/data/models/newsModel.dart';
import 'package:baghdad_fair/features/homeBody/news/data/repository/newsRepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class NewsRepositoryImplementation implements NewsRepository {
  final ApiService _apiService;
  NewsRepositoryImplementation(this._apiService);

  @override
  Future<Either<Failures, NewsModel>> getNews({
    required String filter,
    int page = 1,
  }) async{
    try {
      var data = await _apiService.get(endpoint: 'news?$filter&limit=${_apiService.limit}&page=$page');
      NewsModel model = NewsModel.fromJson(data);
      return right(model);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}