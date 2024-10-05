import 'package:baghdad_fair/core/utilities/appAssets.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MainLinks extends StatelessWidget {
  const MainLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.scale(
          scale: 1.1,
          child: SvgPicture.asset(
            AppAssets.linksImage
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: MediaQuery.of(context).size.width >= 600 ? horizontalPadding * 5 : horizontalPadding,
            end: MediaQuery.of(context).size.width >= 600 ? horizontalPadding * 5 : 0
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).contact_info,
                    style: AppStyles.gradientBoxTextStyle,
                  ),
                  const SizedBox(height: 8,),
                  const Row(
                    children: [
                      Image(
                        image: AssetImage(AppAssets.email),
                        width: 25,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'iraqifairs@mot.gov.iq',
                        style: AppStyles.bodySmall,
                      )
                    ],
                  ),
                  const Row(
                    children: [
                      Image(
                        image: AssetImage(AppAssets.search),
                        width: 25,
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'www.fairs.gov.iq',
                        style: AppStyles.bodySmall,
                      )
                    ],
                  )
                ],
              ),
              const Column(
                
                children: [
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 20,end: 15),
                        child: Image(
                          image: AssetImage(AppAssets.x),
                          height: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Image(
                          image: AssetImage(AppAssets.facebook),
                        ),
                      ),Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Image(
                          image: AssetImage(AppAssets.google),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}