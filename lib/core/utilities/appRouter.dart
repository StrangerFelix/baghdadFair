import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/baghdadFair/aboutUs/presentation/views/aboutUsBody.dart';
import 'package:baghdad_fair/features/baghdadFair/baghdadFair/presentation/views/baghdadFairBody.dart';
import 'package:baghdad_fair/features/complaints/presentation/views/complaintsView.dart';
import 'package:baghdad_fair/features/main/presentation/views/homeView.dart';
import 'package:baghdad_fair/features/ads/presentation/views/adsBody.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/views/fairsBody.dart';
import 'package:baghdad_fair/features/home/presentation/views/mainHomeBody.dart';
import 'package:baghdad_fair/features/news/news/data/models/newsModel.dart';
import 'package:baghdad_fair/features/news/news/presentation/views/newsBody.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/views/participatingCompaniesBody.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCountries/presentation/views/participatingCountriesBody.dart';
import 'package:baghdad_fair/features/baghdadFair/sponsoringCompanies/presentation/views/sponsoringCompaniesBody.dart';
import 'package:baghdad_fair/features/videos/presentation/views/videosLibraryBody.dart';
import 'package:baghdad_fair/features/news/newsDetails/presentation/views/newsScreen.dart';
import 'package:baghdad_fair/features/splash/presentation/views/splashView.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<String> bfRoutes = [
  AppRouter.aboutUs,
  AppRouter.participatingCountries,
  AppRouter.participatingCompanies,
  AppRouter.sponsoringCompanies
];

abstract class AppRouter {
  static const home = '/home';
  static const aboutUs = '/bf/aboutUs';
  static const news = "/news";
  static const newsDetails = "/newsDetails";
  static const videosLibrary = "/videosLibrary";
  static const fairs = "/bf/fairs";
  static const participatingCountries = "/bf/participatingCountries";
  static const participatingCompanies = "/bf/participatingCompanies";
  static const sponsoringCompanies = "/bf/sponsoringCompanies";
  static const ads = "/ads";
  static const complaints = '/complaints';

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
          return NewsScreen(news: news);
        } 
      ),
      GoRoute(
        path: complaints,
        builder: (context, state) => const ComplaintsView(),
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
              StatefulShellRoute.indexedStack(
                builder: (context, state, navigationShell) => BaghdadFairBody(navigationShell: navigationShell),
                branches: [
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
                        path: sponsoringCompanies,
                        builder: (context, state) => const SponsoringCompaniesBody(),
                      ),
                    ],
                  ),
                ]
              )
            ]
          ),
          // StatefulShellBranch(
          //   routes: [
          //     GoRoute(
          //       path: '/bf',
          //       builder: (context, state) => const BaghdadFairBody(),
          //       routes: [
          //         GoRoute(
          //           path: 'aboutUs',
          //           builder: (context, state) => const AboutUsBody(),
          //         ),
          //         GoRoute(
          //           path: 'participatingCountries',
          //           builder: (context, state) => const ParticipatingCountriesBody(),
          //         ),
          //         GoRoute(
          //           path: 'fairs',
          //           builder: (context, state) => const FairsBody(),
          //         ),
          //         GoRoute(
          //           path: 'participatingCompanies',
          //           builder: (context, state) => const ParticipatingCompaniesBody(),
          //         ),
          //         GoRoute(
          //           path: 'sponsoringCompanies',
          //           builder: (context, state) => const SponsoringCompaniesBody(),
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
          
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
                path: ads,
                builder: (context, state) => const AdsBody(),
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