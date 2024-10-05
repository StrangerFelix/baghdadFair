import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/splash/presentation/views/widgets/splashViewBody.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryBackgroundColor,
      body: SplashViewBody(),
    );
  }
}
