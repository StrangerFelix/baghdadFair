import 'package:baghdad_fair/core/components/constrainedSliverToBoxAdapter.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/main/data/models/navBarModel.dart';
import 'package:baghdad_fair/features/main/presentation/views/widgets/homeAppBar.dart';
import 'package:baghdad_fair/features/main/presentation/views/widgets/homeAppBarImage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.navigationShell,super.key});
  final StatefulNavigationShell navigationShell;

  //  @override
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        navBarItems(context)[currentPageIndex].executeEvent();
      },
      edgeOffset: MediaQuery.of(context).padding.top + 50,
      color: primaryTextColor,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const HomeAppBar(),
          const HomeAppBarImage(),
          // const HomeNavBar(),
          ConstrainedSliverToBoxAdapter(
            child: navigationShell
          )
        ],
      ),
    );
  }
}

