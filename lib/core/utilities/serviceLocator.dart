import 'package:baghdad_fair/core/utilities/apiService.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/data/repository/aboutUsRepoImpl.dart';
import 'package:baghdad_fair/features/ads/data/repository/adsRepoImpl.dart';
import 'package:baghdad_fair/features/fairs/fairs/data/repository/fairsRepoImpl.dart';
import 'package:baghdad_fair/features/home/data/repository/homeRepoImpl.dart';
import 'package:baghdad_fair/features/news/news/data/repository/newsRepoImpl.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/data/repository/companiesRepoImpl.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/data/repository/countriesRepoImpl.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/data/repository/sponsoringRepoImpl.dart';
import 'package:baghdad_fair/features/videos/data/repository/videosRepoImpl.dart';
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
  getIt.registerSingleton<CountriesRepositoryImplementation>(
    CountriesRepositoryImplementation(getIt.get<ApiService>())
  );
  getIt.registerSingleton<CompaniesRepositoryImplementation>(
    CompaniesRepositoryImplementation(getIt.get<ApiService>())
  );
  getIt.registerSingleton<AdsRepositoryImplementation>(
    AdsRepositoryImplementation(getIt.get<ApiService>())
  );
  getIt.registerSingleton<SponsoringRepositoryImplementation>(
    SponsoringRepositoryImplementation(getIt.get<ApiService>())
  );
}
