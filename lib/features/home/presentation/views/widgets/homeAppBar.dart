import 'dart:ui';

import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/core/components/constrainedSliverWidth.dart';
import 'package:baghdad_fair/features/home/presentation/views/widgets/languageDropdownButton.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({this.topPaddingFraction = 0,super.key});
  final double topPaddingFraction;
  @override
  Widget build(BuildContext context) {
    return ConstrainedSliverWidth(
      maxWidth: 600,
      sliver: SliverPersistentHeader(
        floating: true,
        delegate: _SliverAppBarDelegate(
          minHeight: 80,
          maxHeight: 105,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
              child: Container(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 10,
                    top: topPaddingFraction > 0.5 ? (MediaQuery.of(context).padding.top) * topPaddingFraction : 0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: topPaddingFraction > 0.6 ? CrossAxisAlignment.end : CrossAxisAlignment.center,
                    children: [
                        Padding(
                        padding: const EdgeInsetsDirectional.only(start: horizontalPadding),
                        child: Row(
                          children: [
                            const Image(
                              image: AssetImage(AppAssets.logo),
                              width: 55,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                S.of(context).title,
                                style: MediaQuery.of(context).size.width < 420 
                                ? AppStyles.titleMedium.copyWith(
                                  fontSize: Intl.getCurrentLocale() == 'en' ? 22 : 24
                                ) : AppStyles.titleLarge,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 90,
                        height: 40,
                        decoration: AppStyles.primaryBoxDeocration(
                          hasBorRadius: false,
                          hasBoxShadows: false
                        ),
                        child: const Center(child: LanguageDropDownButton()),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return oldDelegate.minHeight != minHeight ||
        oldDelegate.maxHeight != maxHeight ||
        oldDelegate.child != child;
  }
}
