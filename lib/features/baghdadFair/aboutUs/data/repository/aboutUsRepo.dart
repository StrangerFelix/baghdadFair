import 'package:baghdad_fair/core/errors/failures.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/data/models/aboutUsModel.dart';
import 'package:dartz/dartz.dart';

abstract class AboutUsRepository {
  Future<Either<Failures,AboutUsModel>> getAboutUsContext();
}