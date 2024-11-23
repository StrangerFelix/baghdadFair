import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/homeBody/home/data/models/homeModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failures,HomeModel>> getHomeBody();
  Future<Either<Failures,String>> sendReport({
    required String name,
    required String email,
    required String subject,
    required String message
  });
}