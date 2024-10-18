abstract class VideosEvents {}

class GetVideosEvent extends VideosEvents {
  final String filter;
  final int page;
  final bool isPagination;
  GetVideosEvent({this.page = 1,this.filter = '',this.isPagination = false});
}