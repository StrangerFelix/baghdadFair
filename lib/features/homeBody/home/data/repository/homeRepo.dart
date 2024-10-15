import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failures,dynamic>> fetchHomeBody();
  sendReport();
}