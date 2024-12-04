import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/data/models/sponsoringModel.dart';

abstract class SponsorsStates {}
class SponsorsInitial extends SponsorsStates {}

class SponsorsLoading extends SponsorsStates {}
class SponsorsLoaded extends SponsorsStates {
  final SponsorsModel model;
  SponsorsLoaded(this.model);
}
class SponsorsFailure extends SponsorsStates {
  final String error;
  SponsorsFailure(this.error);
}