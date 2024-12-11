import 'package:baghdad_fair/core/components/baghdadFairTitle.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/features/home/data/models/homeModel.dart';
import 'package:baghdad_fair/features/home/presentation/manager/home/homeBloc.dart';
import 'package:baghdad_fair/features/home/presentation/manager/home/homeStates.dart';
import 'package:baghdad_fair/features/home/presentation/views/components/mainContactUs.dart';
import 'package:baghdad_fair/features/home/presentation/views/components/mainDetails.dart';
import 'package:baghdad_fair/features/home/presentation/views/components/mainHomeInfo.dart';
import 'package:baghdad_fair/features/home/presentation/views/components/mainLinks.dart';
import 'package:baghdad_fair/features/home/presentation/views/components/mainMaps.dart';
import 'package:baghdad_fair/features/home/presentation/views/components/mainShowTimeInfo.dart';
import 'package:baghdad_fair/features/home/presentation/views/components/participationInstructionsButton.dart';
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
            const BaghdadFairTitle(),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.white,
            ),
            const SizedBox(height: 10,),
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
            const ParticipationInstructionsButton(),
            const MainMaps(),
            MainContactUs(
              addressInfo: S.of(context).address_info,
              phoneInfo: S.of(context).phone_info,
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
