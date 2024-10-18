import 'package:baghdad_fair/features/homeBody/news/data/repository/newsRepo.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/manager/news/newsEvents.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/manager/news/newsStates.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsBloc extends Bloc<NewsEvents,NewsStates> {
  final NewsRepository _newsRepository;
  NewsBloc(this._newsRepository) : super (NewsInitial()) {
    on<NewsEvents>((event,emit) async{
      if (event is GetNewsEvent) {
        if (event.isPagination) {
          emit(NewsPaginationLoading());
        } else {
          emit(NewsLoading());
        }
        var data = await _newsRepository.getNews(
          filter: event.filter,
          page: event.page,
        );
        data.fold(
          (failure) => emit(NewsFailure(failure.errorMessage)),
          (model) => emit(NewsLoaded(model)) 
        );
      }
    });
  }
}