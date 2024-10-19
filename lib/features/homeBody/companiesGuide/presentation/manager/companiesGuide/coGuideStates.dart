import 'package:baghdad_fair/features/homeBody/companiesGuide/data/models/companiesGuideModel.dart';

abstract class CompaniesGuideStates {}
class CompaniesGuideInitial extends CompaniesGuideStates {}

class CompaniesGuideLoading extends CompaniesGuideStates {}
class CompaniesGuidePaginationLoading extends CompaniesGuideStates {}
class CompaniesGuideLoaded extends CompaniesGuideStates {
  final CompaniesGuideModel model;
  CompaniesGuideLoaded(this.model);
}
class CompaniesGuideFailure extends CompaniesGuideStates {
  final String error;
  CompaniesGuideFailure(this.error);
}
