import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/data/repository/aboutUsRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/fairs/data/repository/fairsRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/home/data/repository/homeRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/news/data/repository/newsRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/data/repository/videosRepoImpl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepositoryImplementation>(
    HomeRepositoryImplementation(getIt.get<ApiService>())
  );
  getIt.registerSingleton<AboutUsRepositoryImplementation>(
    AboutUsRepositoryImplementation(getIt.get<ApiService>())
  );
  getIt.registerSingleton<NewsRepositoryImplementation>(
    NewsRepositoryImplementation(getIt.get<ApiService>())
  );
  getIt.registerSingleton<VideosRepositoryImplementation>(
    VideosRepositoryImplementation(getIt.get<ApiService>())
  );
  getIt.registerSingleton<FairsRepositoryImplementation>(
    FairsRepositoryImplementation(getIt.get<ApiService>())
  );
}
