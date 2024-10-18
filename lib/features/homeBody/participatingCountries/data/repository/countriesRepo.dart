import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/homeBody/participatingCountries/data/models/countriesModel.dart';
import 'package:dartz/dartz.dart';

abstract class CountriesRepository {
  Future<Either<Failures, CountriesModel>> getCountries({
    required String filter,
  });
}