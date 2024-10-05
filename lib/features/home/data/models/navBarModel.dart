import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';

class NavBarItem {
  final String name;
  final String path;
  const NavBarItem({required this.name,required this.path});
}

List<NavBarItem> navBarItems (BuildContext context) {
  return [
    const NavBarItem(
      name: "home",
      path: AppRouter.home
    ),
    NavBarItem(
      name: S.of(context).about_us, 
      path: AppRouter.aboutUs
    ),
    NavBarItem(
      name: S.of(context).news, 
      path: AppRouter.news
    ),
    NavBarItem(
      name: S.of(context).vid_library, 
      path: AppRouter.videosLibrary
    ),
    NavBarItem(
      name: S.of(context).fairs, 
      path: AppRouter.fairs
    ),
    NavBarItem(
      name: S.of(context).par_countries, 
      path: AppRouter.participatingCountries
    ),
    NavBarItem(
      name: S.of(context).par_companies, 
      path: AppRouter.participatingCompanies
    ),
    NavBarItem(
      name: S.of(context).companies_guide, 
      path: AppRouter.companiesGuide
    ),
    NavBarItem(
      name: S.of(context).sponsoring_companies, 
      path: AppRouter.sponsoringCompanies
    ),
    NavBarItem(
      name: S.of(context).ads, 
      path: AppRouter.ads
    ),
    // NavBarItem(
    //   name: S.of(context).statistics, 
    //   path: AppRouter.statistics
    // ),
  ];
} 