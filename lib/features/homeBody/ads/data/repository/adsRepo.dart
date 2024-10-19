import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/homeBody/ads/data/models/adsModel.dart';
import 'package:dartz/dartz.dart';

abstract class AdsRepository {
  Future<Either<Failures, AdsModel>> getAds({
    required String filter, 
    int page = 1
  });
}