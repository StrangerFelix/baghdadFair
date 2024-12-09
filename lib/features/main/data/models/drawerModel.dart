import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/features/main/data/models/navBarModel.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerModel {
  final String title;
  final String icon;
  final void Function()? onTap;
  DrawerModel({required this.title,required this.icon, this.onTap});
}
List<DrawerModel> drawerButtons (BuildContext context) {
  return [
    DrawerModel(
      title: S.of(context).home,
      icon: AppAssets.home,
      onTap: () {
        currentPageIndex = 5;
        Navigator.of(context).pop();
        context.go(AppRouter.home);
      },
    ),
    DrawerModel(
      title: S.of(context).title,
      icon: AppAssets.bflogo,
      onTap: () {
        
        currentPageIndex = lastBfPageIndex;
        Navigator.of(context).pop();
        context.go(bfRoutes[lastBfPageIndex]);
      },
    ),
    DrawerModel(
      title: S.of(context).news,
      icon: AppAssets.news,
      onTap: () {
        currentPageIndex = 6;
        Navigator.of(context).pop();
        context.go(AppRouter.news);
      },
    ),
    DrawerModel(
      title: S.of(context).vid_library,
      icon: AppAssets.videos,
      onTap: () {
        currentPageIndex = 7;
        Navigator.of(context).pop();
        context.go(AppRouter.videosLibrary);
      },
    ),
    DrawerModel(
      title: S.of(context).ads,
      icon: AppAssets.ads,
      onTap: () {
        currentPageIndex = 8;
        Navigator.of(context).pop();
        context.go(AppRouter.ads);
      },
    ),
    DrawerModel(
      title: S.of(context).complaints,
      icon: AppAssets.complaints,
      // onTap: () => context.go(AppRouter.ads),
    ),
  ];
} 