import 'package:baghdad_fair/core/utilities/serviceLocator.dart';
import 'package:baghdad_fair/features/main/presentation/managers/language/languageCubit.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/data/repository/aboutUsRepoImpl.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/presentation/manager/aboutUs/aboutUsBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/presentation/manager/aboutUs/aboutUsEvents.dart';
import 'package:baghdad_fair/features/ads/data/repository/adsRepoImpl.dart';
import 'package:baghdad_fair/features/ads/presentation/manager/ads/adsBloc.dart';
import 'package:baghdad_fair/features/ads/presentation/manager/ads/adsEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/data/repository/fairsRepoImpl.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/presentation/manager/fairs/fairsBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/presentation/manager/fairs/fairsEvents.dart';
import 'package:baghdad_fair/features/home/data/repository/homeRepoImpl.dart';
import 'package:baghdad_fair/features/home/presentation/manager/home/homeBloc.dart';
import 'package:baghdad_fair/features/home/presentation/manager/home/homeEvents.dart';
import 'package:baghdad_fair/features/news/news/data/repository/newsRepoImpl.dart';
import 'package:baghdad_fair/features/news/news/presentation/manager/news/newsBloc.dart';
import 'package:baghdad_fair/features/news/news/presentation/manager/news/newsEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/data/repository/companiesRepoImpl.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/data/repository/countriesRepoImpl.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/manager/countries/countriesBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/manager/countries/countriesEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/data/repository/sponsoringRepoImpl.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/manager/sponsors/sponsorsBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/manager/sponsors/sponsorsEvents.dart';
import 'package:baghdad_fair/features/videos/data/repository/videosRepoImpl.dart';
import 'package:baghdad_fair/features/videos/presentation/manager/videos/videosBloc.dart';
import 'package:baghdad_fair/features/videos/presentation/manager/videos/videosEvents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:nested/nested.dart';

List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => LanguageCubit(),),
  BlocProvider(create: (context) => HomeBloc(getIt.get<HomeRepositoryImplementation>())..add(GetHomeDataEvent()),),
  BlocProvider(create: (context) => AboutUsBloc(getIt.get<AboutUsRepositoryImplementation>())..add(GetAboutUsEvent()),),
  BlocProvider(create: (context) => NewsBloc(getIt.get<NewsRepositoryImplementation>())..add(GetNewsEvent()),),
  BlocProvider(create: (context) => VideosBloc(getIt.get<VideosRepositoryImplementation>())..add(GetVideosEvent()),),
  BlocProvider(create: (context) => FairsBloc(getIt.get<FairsRepositoryImplementation>())..add(GetFairsEvent()),),
  BlocProvider(create: (context) => CountriesBloc(getIt.get<CountriesRepositoryImplementation>())..add(GetCountriesEvent()),),
  BlocProvider(create: (context) => CompaniesBloc(getIt.get<CompaniesRepositoryImplementation>())..add(GetCompaniesEvent()),),
  BlocProvider(create: (context) => AdsBloc(getIt.get<AdsRepositoryImplementation>())..add(GetAdsEvent()),),
  BlocProvider(create: (context) => SponsorsBloc(getIt.get<SponsoringRepositoryImplementation>())..add(GetSponsorsEvent()),),
];
