import 'package:baghdad_fair/core/utilities/serviceLocator.dart';
import 'package:baghdad_fair/features/home/presentation/managers/language/languageCubit.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/data/repository/aboutUsRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/manager/aboutUs/aboutUsBloc.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/manager/aboutUs/aboutUsEvents.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/data/repository/coGuideRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/companiesGuide/coGuideBloc.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/companiesGuide/coGuideEvents.dart';
import 'package:baghdad_fair/features/homeBody/fairs/data/repository/fairsRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/manager/fairs/fairsBloc.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/manager/fairs/fairsEvents.dart';
import 'package:baghdad_fair/features/homeBody/home/data/repository/homeRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/home/homeBloc.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/home/homeEvents.dart';
import 'package:baghdad_fair/features/homeBody/news/data/repository/newsRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/manager/news/newsBloc.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/manager/news/newsEvents.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/data/repository/companiesRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/manager/companies/companiesBloc.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/manager/companies/companiesEvents.dart';
import 'package:baghdad_fair/features/homeBody/participatingCountries/data/repository/countriesRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/participatingCountries/presentation/manager/countries/countriesBloc.dart';
import 'package:baghdad_fair/features/homeBody/participatingCountries/presentation/manager/countries/countriesEvents.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/data/repository/videosRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/presentation/manager/videos/videosBloc.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/presentation/manager/videos/videosEvents.dart';
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
  BlocProvider(create: (context) => CompaniesGuideBloc(getIt.get<CompaniesGuideRepositoryImplementation>())..add(GetCompaniesGuideEvent()),),

];
