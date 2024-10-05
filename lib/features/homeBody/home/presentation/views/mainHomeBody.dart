import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainContactUs.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainDetails.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainHomeInfo.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainLinks.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainMap.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainShowTimeInfo.dart';
import 'package:flutter/material.dart';

class MainHomeBody extends StatelessWidget {
  const MainHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: horizontalPadding,
              right: horizontalPadding
            ),
            decoration: AppStyles.primaryBoxDeocration(),
            child: const Column(
              children: [
                MainHomeInfo(
                  orginazerTitle: 'bobj',
                  durationTitle: 'bobj',
                  locationTitle: 'bobj',
                  specializationTitle: 'bobj',
                ),
                MainShowTimeInfo(),
                MainDetails(
                  details: 'تحت شعار (استثمار، تنمية، ازدهار) ستعقد الدورة (48) لمعرض بغداد الدولي للفترة من 1/11/2024 الى 7/11/2024 على ارض معرض بغداد الدولي وبمشاركة واسعة من قبل الدول والشركات المحلية والعربية والاجنبية',
                ),
                MainMap(),
              ],
            ),
          ),
          const MainContactUs(
            addressInfo: 'bobj',
            phoneInfo: 'bobj',
          ),
          const MainLinks()
        ],
      );
  }
}