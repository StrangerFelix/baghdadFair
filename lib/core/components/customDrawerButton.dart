import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/main/data/models/navBarModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({this.pageNumber = -1,this.onTap,required this.icon,required this.title,super.key});
  final void Function()? onTap;
  final String icon;
  final int pageNumber;
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: (currentPageIndex >= 0 && currentPageIndex < bfRoutes.length && pageNumber == 1) ? primaryBackgroundColor : currentPageIndex == pageNumber ? primaryBackgroundColor : Colors.transparent,
        height: 65,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                fit: BoxFit.cover,
                width: 25,
                height: 25,
              ),
              const SizedBox(width: 20,),
              Text(
                title,
                style: AppStyles.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}