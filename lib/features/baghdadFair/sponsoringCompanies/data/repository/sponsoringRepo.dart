import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/data/models/sponsoringModel.dart';
import 'package:dartz/dartz.dart';

abstract class SponsoringRepository {
  Future<Either<Failures,SponsorsModel>> getSponsors();
}