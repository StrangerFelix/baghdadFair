import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/main/data/models/navBarModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}


class _HomeNavBarState extends State<HomeNavBar> {
  // int itemCount: navBarItems(context).length;
  void _setCurrentPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only( top: 2, ),
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: bfNavItems,
        // itemCount: navBarItems(context).length,
        itemBuilder: (context,index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsetsDirectional.only(
                start: horizontalPadding
              ),
              child: Container(
                decoration: AppStyles.primaryBoxDeocration (
                  hasBoxShadows: false,
                  hasSevralParts: true,
                  alignment: AlignmentDirectional.centerStart
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 15,),
                    TextButton(
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        _setCurrentPage(index);
                        lastBfPageIndex = currentPageIndex;
                        context.go(navBarItems(context)[index].path);
                      }, 
                      child: Text(
                        navBarItems(context)[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: currentPageIndex == index ? activeColor : primaryTextColor
                        ),
                      )
                    ),
                  ],
                ),
              ),
            );
          }
          if (index == bfNavItems - 1) { // if (index == navBarItems(context).length - 1)
            return Padding(
              padding: const EdgeInsetsDirectional.only(end: horizontalPadding),
              child: Container(
                decoration: AppStyles.primaryBoxDeocration(
                  hasSevralParts: true,
                  hasBoxShadows: false,
                  alignment: AlignmentDirectional.centerEnd
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        _setCurrentPage(index);
                        lastBfPageIndex = currentPageIndex;
                        
                        context.go(navBarItems(context)[index].path);
                      }, 
                      child: Text(navBarItems(context)[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: index == currentPageIndex ? activeColor : primaryTextColor),)
                    ),
                    const SizedBox(width: 15,),
                  ],
                ),
              ),
            );
          }
          return Container(
            decoration: AppStyles.primaryBoxDeocration(
              hasBorRadius: false,
              hasBoxShadows: false,
            ),
            child: TextButton(
              onPressed: () {
                HapticFeedback.selectionClick();
                _setCurrentPage(index);
                lastBfPageIndex = currentPageIndex;
                context.go(navBarItems(context)[index].path);
              }, 
              child: Text(navBarItems(context)[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: index == currentPageIndex ? activeColor : primaryTextColor),)
            ),
          );
        }
      ),
    );
  }
}
