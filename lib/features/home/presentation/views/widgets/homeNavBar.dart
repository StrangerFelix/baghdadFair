import 'package:baghdad_fair/core/components/constrainedSliverWidth.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/home/data/models/navBarModel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}


class _HomeNavBarState extends State<HomeNavBar> {

  void _setCurrentPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return ConstrainedSliverWidth(
      maxWidth: 600,
      sliver: SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsetsDirectional.only( top: 2, ),
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: navBarItems(context).length,
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
                    child: TextButton(
                      onPressed: () {
                        _setCurrentPage(index);
                        context.go(navBarItems(context)[index].path);
                      }, 
                      child: Icon(
                        Icons.home,
                        size: 20,
                        color: index == currentPageIndex ? activeColor : primaryTextColor,
                      )
                    ),
                  ),
                );
              }
              if (index == navBarItems(context).length - 1) { // if (index == itemsCount - 1)
                return Padding(
                  padding: const EdgeInsetsDirectional.only(end: horizontalPadding),
                  child: Container(
                    decoration: AppStyles.primaryBoxDeocration(
                      hasSevralParts: true,
                      hasBoxShadows: false,
                      alignment: AlignmentDirectional.centerEnd
                    ),
                    child: TextButton(
                      onPressed: () {
                        _setCurrentPage(index);
                        context.go(navBarItems(context)[index].path);
                      }, 
                      child: Text(navBarItems(context)[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: index == currentPageIndex ? activeColor : primaryTextColor),)
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
                    _setCurrentPage(index);
                    context.go(navBarItems(context)[index].path);
                  }, 
                  child: Text(navBarItems(context)[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: index == currentPageIndex ? activeColor : primaryTextColor),)
                ),
              );
            }
          ),
        )
      
      ),
    );
  }
}
