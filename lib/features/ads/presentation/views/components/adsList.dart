import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/utilities/pagesPagination.dart';
import 'package:baghdad_fair/features/ads/data/models/adsModel.dart';
import 'package:baghdad_fair/features/ads/presentation/manager/ads/adsBloc.dart';
import 'package:baghdad_fair/features/ads/presentation/manager/ads/adsStates.dart';
import 'package:baghdad_fair/features/ads/presentation/views/components/adsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdsList extends StatefulWidget {
  const AdsList({super.key});

  @override
  State<AdsList> createState() => _AdsListState();
}

class _AdsListState extends State<AdsList> {
  List<Ad> ads = [];
  String? error;
  int limitCounter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsBloc, AdsStates>(
      builder: (context, state) {
        if (state is AdsLoading) {
          adsHasMore = true; // لان راح يترست
          ads = []; // if refreshing {تكدر تحددها من تستدعي الايفينت تكله اذا باكنيشن او لا}
          adsPagination = 1;
        }
        if (state is AdsFailure) {
          error = state.error;
        }
        if (state is AdsLoaded) {
          for (var item in state.model.data!.response!) {
            limitCounter++;
            ads.add(item);
          }
          if (limitCounter < 6) { // 6 is the limit
            adsHasMore = false;
          }
          limitCounter = 0;
        }
        return SizedBox(
          child: state is! AdsLoading ?
            state is! AdsFailure ?
            ads.isNotEmpty ?
            ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ads.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index < ads.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: AdsItem(
                    image: ads[index].image,
                    location: ads[index].location,
                    date: ads[index].createdAt!.substring(0, 10),
                    time: ads[index].createdAt!.substring(11, 16),
                  ),
                );
              }
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: adsHasMore
                      ? const CustomLoadingIndicator()
                      : const SizedBox());
            },
          ) : const CustomEmptyWidget()
            : CustomErrorWidget(error: error,) 
            : const CustomLoadingWidget()
        );
      },
    );
  }
}
