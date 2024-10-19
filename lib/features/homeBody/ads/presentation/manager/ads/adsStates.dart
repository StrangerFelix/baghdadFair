import 'package:baghdad_fair/features/homeBody/ads/data/models/adsModel.dart';

abstract class AdsStates {}
class AdsInitial extends AdsStates {}

class AdsLoading extends AdsStates {}
class AdsPaginationLoading extends AdsStates {}

class AdsLoaded extends AdsStates {
  final AdsModel model;
  AdsLoaded(this.model);
}
class AdsFailure extends AdsStates {
  final String error;
  AdsFailure(this.error);
}