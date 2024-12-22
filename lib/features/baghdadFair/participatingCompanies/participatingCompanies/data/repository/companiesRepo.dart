import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/participatingCompanies/data/models/companiesModel.dart';
import 'package:dartz/dartz.dart';

abstract class CompaniesRepository {
  Future<Either<Failures, CompaniesModel>> getCompanies({
    required String filter,
    int page = 1,
  });
}