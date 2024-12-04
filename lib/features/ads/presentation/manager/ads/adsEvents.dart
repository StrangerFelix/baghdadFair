abstract class AdsEvents {}
class GetAdsEvent extends AdsEvents {
  final String filter;
  final int page;
  final bool isPagination;
  GetAdsEvent({this.page = 1,this.filter = '',this.isPagination = false});
}