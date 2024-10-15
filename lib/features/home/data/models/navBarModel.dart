import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/manager/aboutUs/aboutUsBloc.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/manager/aboutUs/aboutUsEvents.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/home/homeBloc.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/home/homeEvents.dart';
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
int currentPageIndex = 0;
List<NavBarItem> navBarItems (BuildContext context) {
  return [
    NavBarItem(
      name: "home",
      path: AppRouter.home,
      event: () {
        context.read<HomeBloc>().add(GetHomeDataEvent());
      }
    ),
    NavBarItem(
      name: S.of(context).about_us, 
      path: AppRouter.aboutUs,
      event: () {
        context.read<AboutUsBloc>().add(GetAboutUsEvent());
      },
    ),
    NavBarItem(
      name: S.of(context).news, 
      path: AppRouter.news,
      event: () {
        print ('Page 3');
      }
    ),
    NavBarItem(
      name: S.of(context).vid_library, 
      path: AppRouter.videosLibrary,
      event: () {
        print ('Page 4');
      }
    ),
    NavBarItem(
      name: S.of(context).fairs, 
      path: AppRouter.fairs,
      event: () {
        print ('Page 5');
      }
    ),
    NavBarItem(
      name: S.of(context).par_countries, 
      path: AppRouter.participatingCountries,
      event: () {
        print ('Page 6');
      }
    ),
    NavBarItem(
      name: S.of(context).par_companies, 
      path: AppRouter.participatingCompanies,
      event: () {
        print ('Page 7');
      }
    ),
    NavBarItem(
      name: S.of(context).companies_guide, 
      path: AppRouter.companiesGuide,
      event: () {
        print ('Page 8');
      }
    ),
    NavBarItem(
      name: S.of(context).sponsoring_companies, 
      path: AppRouter.sponsoringCompanies,
      event: () {
        print ('Page 9');
      }
    ),
    NavBarItem(
      name: S.of(context).ads, 
      path: AppRouter.ads,
      event: () {
        print ('Page 10');
      }
    ),
    // NavBarItem(
    //   name: S.of(context).statistics, 
    //   path: AppRouter.statistics
    // ),
  ];
} 