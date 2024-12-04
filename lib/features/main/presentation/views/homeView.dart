import 'package:baghdad_fair/features/main/presentation/views/widgets/homeViewBody.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    required this.navigationShell, Key? key
  }) : super(key: key ?? const ValueKey<String>('HomeView'));

  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(navigationShell: navigationShell,),
    );
  }
}