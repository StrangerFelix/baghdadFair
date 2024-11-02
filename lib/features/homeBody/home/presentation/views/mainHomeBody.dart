import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/features/homeBody/home/data/models/homeModel.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/home/homeBloc.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/home/homeStates.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainContactUs.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainDetails.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainHomeInfo.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainLinks.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainMap.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/views/components/mainShowTimeInfo.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainHomeBody extends StatefulWidget {
  const MainHomeBody({super.key});

  @override
  State<MainHomeBody> createState() => _MainHomeBodyState();
}

class _MainHomeBodyState extends State<MainHomeBody> {
  HomeData? _homeData;
  String? error;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeStates>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          if (state.model.data!.response!.isNotEmpty) {
            _homeData = state.model.data?.response?[0];
          }
          
        }
        if (state is HomeFailure) {
          error = state.error;
        }
        return state is! HomeLoading ?
        state is! HomeFailure ?
        state is HomeLoaded && _homeData != null?
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 20, left: horizontalPadding, right: horizontalPadding),
              decoration: AppStyles.primaryBoxDeocration(),
              child: Column(
                children: [
                  MainHomeInfo(
                    orginazerTitle: _homeData!.organizer,
                    durationTitle: _homeData!.dates,
                    locationTitle: _homeData!.locations,
                    specializationTitle: _homeData!.specialization,
                  ),
                  MainShowTimeInfo(data: _homeData,),
                  MainDetails(
                    details: _homeData!.details
                  ),
                  const MainMap(),
                ],
              ),
            ),
            const MainContactUs(
              addressInfo: 'بغداد المنصور - معرض بغداد الدولي - مبنى قاعة (VIP)',
              phoneInfo: '+9647901800183 الاحد الى الخميس',
            ),
            const MainLinks()
          ],
        ) : CustomErrorWidget(error: S.of(context).error,)
        : CustomErrorWidget(error: error,)
        : const CustomLoadingWidget();
      },
    );
  }
}
