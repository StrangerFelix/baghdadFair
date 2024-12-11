import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/core/utilities/pagesPagination.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/data/models/fairsModel.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/presentation/manager/fairs/fairsBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/presentation/manager/fairs/fairsStates.dart';
import 'package:baghdad_fair/features/baghdadFair/fairs/fairs/presentation/views/components/fairsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FairsList extends StatefulWidget {
  const FairsList({super.key});

  @override
  State<FairsList> createState() => _FairsListState();
}

class _FairsListState extends State<FairsList> {
  List<Fair> fairs = [];
  String? error;
  int limitCounter = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FairsBloc, FairsStates>(
      builder: (context, state) {
        if (state is FairsLoading) {
          fairsHasMore = true; // لان راح يترست
          fairs = []; // if refreshing {تكدر تحددها من تستدعي الايفينت تكله اذا باكنيشن او لا}
          fairsPagination = 1;
        }
        if (state is FairsFailure) {
          error = state.error;
        }
        if (state is FairsLoaded) {
          for (var item in state.model!.data!.response!) {
            limitCounter++;
            fairs.add(item);
          }
          if (limitCounter < 6) { // 6 is the limit
            fairsHasMore = false;
          }
          limitCounter = 0;
        }
        return SizedBox(
          child: state is! FairsLoading ?
            state is! FairsFailure ?
            fairs.isNotEmpty ?
            ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: fairs.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index < fairs.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 5),
                  child: FairsItem(
                    title: fairs[index].name,
                    image: fairs[index].photo,
                    location: fairs[index].location,
                    date: fairs[index].date!.substring(0,10),
                    category: fairs[index].description,
                    fairDate: fairs[index].date!.substring(0,10),
                    fairCategory: fairs[index].specialty,
                    fairType: Intl.getCurrentLocale() == 'en' ? 
                      fairs[index].fairsLocation == "خارج العراق" ? 'Outside iraq' : "Inside iraq"
                      : fairs[index].fairsLocation,
                    fairCondition: Intl.getCurrentLocale() == 'en' ?
                      fairs[index].fairStatus == 'قادمة' ? 'Incoming'
                      : fairs[index].fairStatus == 'جارية' ? ' Pending'
                      : 'Ended'
                      : fairs[index].fairStatus
                    
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: fairsHasMore ? const CustomLoadingIndicator() : const SizedBox()
              );
            },
          ) : const CustomEmptyWidget()
            : CustomErrorWidget(error: error,) 
            : const CustomLoadingWidget()
        );
      },
    );
  }
}
