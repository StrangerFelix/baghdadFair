import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/utilities/constants.dart';
import 'package:baghdad_fair/core/utilities/pagesPagination.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/data/models/companiesGuideModel.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/companiesGuide/coGuideBloc.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/companiesGuide/coGuideStates.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/views/components/coGuideItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CompaniesGuideList extends StatefulWidget {
  const CompaniesGuideList({super.key});

  @override
  State<CompaniesGuideList> createState() => _CompaniesGuideListState();
}

class _CompaniesGuideListState extends State<CompaniesGuideList> {
  int limitCounter = 0;
  List<Guide> guides = [];
  String? error;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompaniesGuideBloc, CompaniesGuideStates>(
      builder: (context, state) {
        if (state is CompaniesGuideLoading) {
          coGuideHasMore = true; // لان راح يترست
          guides = []; // if refreshing {تكدر تحددها من تستدعي الايفينت تكله اذا باكنيشن او لا}
          coGuidePagination = 1;
        }
        if (state is CompaniesGuideFailure) {
          error = state.error;
        }
        if (state is CompaniesGuideLoaded) {
          for (var item in state.model.data!.response!) {
            limitCounter++;
            guides.add(item);
          }
          if (limitCounter < 6) { // 6 is the limit
            coGuideHasMore = false;
          }
          limitCounter = 0;
        }
        return SizedBox(
          child: state is! CompaniesGuideLoading ?
            state is! CompaniesGuideFailure ?
            guides.isNotEmpty ?
            ListView.builder(
            padding: const EdgeInsets.only(top: 10),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: guides.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index < guides.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: horizontalPadding, vertical: 5),
                  child: CompaniesGuideItem(
                    image: guides[index].photo,
                    title: guides[index].companyName,
                    city: guides[index].location,
                    date: guides[index].createdAt!.substring(0,10),
                    category: guides[index].description,
                    phone: guides[index].phone,
                    email: guides[index].email,
                    publicOrPrivate: Intl.getCurrentLocale() == 'en' ?
                        guides[index].companyType == "خاص" ? 'Private' : guides[index].companyType == "عام" ? 'Public' : 'Mixed'
                        : guides[index].companyType
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: coGuideHasMore ? const CustomLoadingIndicator() : const SizedBox()
              );
            },
          ): const CustomEmptyWidget()
            : CustomErrorWidget(error: error,)
            : const CustomLoadingWidget(),
        );
      },
    );
  }
}
