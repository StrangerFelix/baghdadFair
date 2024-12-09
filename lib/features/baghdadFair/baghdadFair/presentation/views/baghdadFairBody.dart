import 'package:baghdad_fair/core/components/baghdadFairTitle.dart';
import 'package:baghdad_fair/features/baghdadFair/baghdadFair/presentation/views/homeNavBar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class BaghdadFairBody extends StatelessWidget {
  const BaghdadFairBody({
    required this.navigationShell, Key? key
  }) : super(key: key ?? const ValueKey<String>('BaghdadFair'));
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BaghdadFairTitle(),
        const HomeNavBar(),
        navigationShell
      ],
    );
  }
}
