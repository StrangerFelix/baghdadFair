import 'package:baghdad_fair/features/news/news/data/models/newsModel.dart';

abstract class NewsStates {}
class NewsInitial extends NewsStates {}

class NewsLoading extends NewsStates {}
class NewsPaginationLoading extends NewsStates {}
class NewsLoaded extends NewsStates {
  final NewsModel? model;
  NewsLoaded(this.model);
}
class NewsFailure extends NewsStates {
  final String error;
  NewsFailure(this.error);
}