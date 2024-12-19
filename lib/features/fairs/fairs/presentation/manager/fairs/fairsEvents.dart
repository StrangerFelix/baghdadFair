abstract class FairsEvents {}

class GetFairsEvent extends FairsEvents{
  final String filter;
  final int page;
  final bool isPagination;
  GetFairsEvent({this.page = 1,this.filter = '',this.isPagination = false});
}