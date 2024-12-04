import 'package:baghdad_fair/core/components/customEmptyWidget.dart';
import 'package:baghdad_fair/core/components/customErrorWidget.dart';
import 'package:baghdad_fair/core/components/customLoadingIndicator.dart';
import 'package:baghdad_fair/core/components/customLoadingWidget.dart';
import 'package:baghdad_fair/core/utilities/pagesPagination.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/data/models/companiesModel.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesBloc.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/manager/companies/companiesStates.dart';
import 'package:baghdad_fair/features/baghdadFair/participatingCompanies/presentation/views/components/participatingCompaniesItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ParticipatingCompaniesList extends StatefulWidget {
  const ParticipatingCompaniesList({super.key});

  @override
  State<ParticipatingCompaniesList> createState() =>
      _ParticipatingCompaniesListState();
}

class _ParticipatingCompaniesListState
    extends State<ParticipatingCompaniesList> {
  List<Company> companies = [];
  String? error;
  int limitCounter = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompaniesBloc, CompaniesStates>(
      builder: (context, state) {
        if (state is CompaniesLoading) {
          parCompaniesHasMore = true; // لان راح يترست
          companies = []; // if refreshing {تكدر تحددها من تستدعي الايفينت تكله اذا باكنيشن او لا}
          parCompaniesPagination = 1;
        }
        if (state is CompaniesFailure) {
          error = state.error;
        }
        if (state is CompaniesLoaded) {
          for (var item in state.model.data!.response!) {
            limitCounter++;
            companies.add(item);
          }
          if (limitCounter < 6) { // 6 is the limit
            parCompaniesHasMore = false;
          }
          limitCounter = 0;
        }
        return SizedBox(
          child: state is! CompaniesLoading ?
            state is! CompaniesFailure ?
            companies.isNotEmpty ?
            ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: companies.length + 1,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index < companies.length) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ParticipatingCompaniesItem(
                      name: companies[index].nameInArabic,
                      secondName: companies[index].nameInEnglish,
                      email: companies[index].email,
                      phone: companies[index].phone,
                      companyDirection: companies[index].specialty,
                      location: companies[index].location,
                      companyType: companies[index].companyType,
                      localOrNot: companies[index].nationality
                    ),
                );
              }
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: parCompaniesHasMore ? const  CustomLoadingIndicator() : const SizedBox());
            },
          ) : const CustomEmptyWidget()
            : CustomErrorWidget(error: error,)
            : const CustomLoadingWidget(),
        );
      },
    );
  }
}
