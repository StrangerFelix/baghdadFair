import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/data/models/fairsModel.dart';
import 'package:dartz/dartz.dart';

abstract class FairsRepository {
  Future<Either<Failures, FairsModel>> getFairs({
    required String filter,
    int page = 1,
  });
}