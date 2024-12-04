abstract class CompaniesEvents {}

class GetCompaniesEvent extends CompaniesEvents {
  final String filter;
  final int page;
  final bool isPagination;
  GetCompaniesEvent({this.page = 1,this.filter = '',this.isPagination = false});
}