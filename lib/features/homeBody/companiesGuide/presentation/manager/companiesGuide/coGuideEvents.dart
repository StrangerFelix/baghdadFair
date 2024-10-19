abstract class CompaniesGuideEvents {}

class GetCompaniesGuideEvent extends CompaniesGuideEvents {
  final String filter;
  final int page;
  final bool isPagination;
  GetCompaniesGuideEvent({this.page = 1,this.filter = '',this.isPagination = false});
}