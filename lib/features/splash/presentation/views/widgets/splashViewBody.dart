import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    splashEnding();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SvgPicture.asset(
                AppAssets.bflogo,
                width: 50,
                height: 50,
              ),
              const SizedBox(width: 10,),
              Text(
                S.of(context).title,
                style: AppStyles.titleLarge.copyWith(fontSize: 28),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return SlideTransition(
              position: animation,
              child: Text(
                S.of(context).join_the_future,
                textAlign: TextAlign.center,
                style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: primaryTextColor.withOpacity(.6)
                  ),
              ),
            );
          },
        )
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    animation = Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }

  void splashEnding() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).pushReplacement(AppRouter.home);
    });
  }
}
