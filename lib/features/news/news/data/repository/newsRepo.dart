import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/news/news/data/models/newsModel.dart';
import 'package:dartz/dartz.dart';

abstract class NewsRepository {
  Future<Either<Failures,NewsModel>> getNews({
    required String filter,
    int page = 1,
  });
}