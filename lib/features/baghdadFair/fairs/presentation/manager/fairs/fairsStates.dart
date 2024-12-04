import 'package:baghdad_fair/features/baghdadFair/fairs/data/models/fairsModel.dart';

abstract class FairsStates {}
class FairsInitial extends FairsStates {}

class FairsLoading extends FairsStates {}
class FairsPaginationLoading extends FairsStates {}
class FairsLoaded extends FairsStates {
  final FairsModel? model;
  FairsLoaded(this.model);
}
class FairsFailure extends FairsStates {
  final String error;
  FairsFailure(this.error);
}