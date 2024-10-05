import 'package:baghdad_fair/core/components/constrainedSliverToBoxAdapter.dart';
import 'package:baghdad_fair/features/home/presentation/views/widgets/homeAppBar.dart';
import 'package:baghdad_fair/features/home/presentation/views/widgets/homeAppBarImage.dart';
import 'package:baghdad_fair/features/home/presentation/views/widgets/homeNavBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({required this.navigationShell,super.key});
  final StatefulNavigationShell navigationShell;
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final ScrollController _scrollController = ScrollController();
  int _currentScrollIndex = 0;
  double fraction = 0;
  
  @override
  void initState() {
    _initScrollingController();
    super.initState();
  }
   @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        const HomeAppBarImage(),
        HomeAppBar(topPaddingFraction: fraction),
        const HomeNavBar(),
        ConstrainedSliverToBoxAdapter(
          child: widget.navigationShell
        )
      ],
    );
  }

  // scrolling functions
  
  void _initScrollingController () {
    _scrollController.addListener(() {
      _currentScrollIndex = (_scrollController.position.pixels / 10 ).round();
          fraction = _currentScrollIndex / 20;
      if(fraction <= 1 && _currentScrollIndex >= 0) {
        setState(() {  
        });
      }
    });
  }
}

