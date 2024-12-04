import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/data/models/companiesModel.dart';

abstract class CompaniesStates {}
class CompaniesInitial extends CompaniesStates {}

class CompaniesLoading extends CompaniesStates {}
class CompaniesPaginationLoading extends CompaniesStates {}
class CompaniesLoaded extends CompaniesStates {
  final CompaniesModel model;
  CompaniesLoaded(this.model);
}
class CompaniesFailure extends CompaniesStates {
  final String error;
  CompaniesFailure(this.error);
}