import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/views/aboutUsBody.dart';
import 'package:baghdad_fair/features/home/presentation/views/homeView.dart';
import 'package:baghdad_fair/features/homeBody/ads/presentation/views/adsBody.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/companiesGuideBody.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/views/fairsBody.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/mainHomeBody.dart';
import 'package:baghdad_fair/features/homeBody/news/data/models/newsModel.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/views/newsBody.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/views/participatingCompaniesBody.dart';
import 'package:baghdad_fair/features/homeBody/participatingCountries/presentation/views/participatingCountriesBody.dart';
import 'package:baghdad_fair/features/homeBody/sponsoringCompanies/presentation/views/sponsoringCompaniesBody.dart';
import 'package:baghdad_fair/features/homeBody/statistics/presentation/views/statisticsBody.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/presentation/views/videosLibraryBody.dart';
import 'package:baghdad_fair/features/newsDetails/presentation/views/newsScreen.dart';
import 'package:baghdad_fair/features/splash/presentation/views/splashView.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const home = '/home';
  static const aboutUs = '/aboutUs';
  static const news = "/news";
  static const newsDetails = "/newsDetails";
  static const videosLibrary = "/videosLibrary";
  static const fairs = "/fairs";
  static const participatingCountries = "/participatingCountries";
  static const participatingCompanies = "/participatingCompanies";
  static const companiesGuide = "/companiesGuide";
  static const sponsoringCompanies = "/sponsoringCompanies";
  static const ads = "/ads";
  static const statistics = '/statistics';

  static final _rootNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  static final router = GoRouter(

    initialLocation: '/',
    navigatorKey: _rootNavigationKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context,state) => const SplashView()
      ),
      GoRoute(
        path: newsDetails,
        builder: (context,state) {
          final news = state.extra as News;
          return NewsScreen(news: news,);
        } 
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context,state,navigationShell) => pagesTransitionBuilder(
          duration: splashEndingNavigationDuration,
          child: HomeView(
            navigationShell: navigationShell
          ),
        ),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: home,
                builder: (context, state) => const MainHomeBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: aboutUs,
                builder: (context, state) => const AboutUsBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: news,
                builder: (context, state) => const NewsBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: videosLibrary,
                builder: (context, state) => const VideosLibraryBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: fairs,
                builder: (context, state) => const FairsBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: participatingCountries,
                builder: (context, state) => const ParticipatingCountriesBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: participatingCompanies,
                builder: (context, state) => const ParticipatingCompaniesBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: companiesGuide,
                builder: (context, state) => const CompaniesGuideBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: sponsoringCompanies,
                builder: (context, state) => const SponsoringCompaniesBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: ads,
                builder: (context, state) => const AdsBody(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: statistics,
                builder: (context, state) => const StatisticsBody(),
              ),
            ],
          ),
        ] 
      )
    ]
  );
}

CustomTransitionPage pagesTransitionBuilder(
    {required Widget child, Duration duration = navigationDuration}) {
  return CustomTransitionPage(
      child: child,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
          child: child,
        );
      });
}