abstract class NewsEvents {}

class GetNewsEvent extends NewsEvents {
  final String filter;
  final int page;
  final bool isPagination;
  GetNewsEvent({this.page = 1,this.filter = '',this.isPagination = false});
}