import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/data/models/companiesGuideModel.dart';
import 'package:dartz/dartz.dart';

abstract class CompaniesGuideRepository {
  Future<Either<Failures, CompaniesGuideModel>> getCompanies({
    required String filter, 
    int page = 1
  });
}