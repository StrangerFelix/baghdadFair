import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/core/utilities/pagesFilters.dart';
import 'package:baghdad_fair/features/ads/presentation/manager/ads/adsBloc.dart';
import 'package:baghdad_fair/features/ads/presentation/manager/ads/adsEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/presentation/manager/aboutUs/aboutUsBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/presentation/manager/aboutUs/aboutUsEvents.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/manager/fairs/fairsBloc.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/manager/fairs/fairsEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/manager/countries/countriesBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/manager/countries/countriesEvents.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/manager/sponsors/sponsorsBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/manager/sponsors/sponsorsEvents.dart';
import 'package:baghdad_fair/features/home/presentation/manager/home/homeBloc.dart';
import 'package:baghdad_fair/features/home/presentation/manager/home/homeEvents.dart';
import 'package:baghdad_fair/features/news/news/presentation/manager/news/newsBloc.dart';
import 'package:baghdad_fair/features/news/news/presentation/manager/news/newsEvents.dart';
import 'package:baghdad_fair/features/videos/presentation/manager/videos/videosBloc.dart';
import 'package:baghdad_fair/features/videos/presentation/manager/videos/videosEvents.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarItem {
  final String name;
  final String path;
  final Function event;
  const NavBarItem({required this.name,required this.path,required this.event});
  
  void executeEvent () {
    event();
  }
}
int currentPageIndex = bfNavItems; // bf_array = 4 , [0,1,2,3] and 4 is the static number of array and means arrray + 1 and leads to homescreen
int lastBfPageIndex = 0;

const bfNavItems = 4;
List<NavBarItem> navBarItems (BuildContext context) {
  return [
    NavBarItem(
      name: S.of(context).about_us, 
      path: AppRouter.aboutUs,
      event: () => context.read<AboutUsBloc>().add(GetAboutUsEvent())
    ),
    NavBarItem(
      name: S.of(context).par_countries, 
      path: AppRouter.participatingCountries,
      event: () => context.read<CountriesBloc>().add(GetCountriesEvent(filter: countriesFilter))
    ),
    NavBarItem(
      name: S.of(context).par_companies, 
      path: AppRouter.participatingCompanies,
      event: () => context.read<CompaniesBloc>().add(GetCompaniesEvent(filter: companiesFilter))
    ),
    NavBarItem(
      name: S.of(context).sponsoring_companies, 
      path: AppRouter.sponsoringCompanies,
      event: () => context.read<SponsorsBloc>().add(GetSponsorsEvent())
    ),
    NavBarItem(
      name: "home",
      path: AppRouter.home,
      event: () => context.read<HomeBloc>().add(GetHomeDataEvent())
    ),
    NavBarItem(
      name: S.of(context).news, 
      path: AppRouter.news,
      event: () => context.read<NewsBloc>().add(GetNewsEvent(filter: newsFilter))
    ),
    NavBarItem(
      name: S.of(context).vid_library, 
      path: AppRouter.videosLibrary,
      event: () => context.read<VideosBloc>().add(GetVideosEvent(filter: videosFilter))
    ),
    NavBarItem(
      name: S.of(context).fairs, 
      path: AppRouter.fairs,
      event: () => context.read<FairsBloc>().add(GetFairsEvent(filter: fairsFilter))
    ),
    NavBarItem(
      name: S.of(context).ads, 
      path: AppRouter.ads,
      event: () => context.read<AdsBloc>().add(GetAdsEvent(filter: adsFilter))
    ),
    
    // NavBarItem(
    //   name: S.of(context).statistics, 
    //   path: AppRouter.statistics
    // ),
  ];
} 