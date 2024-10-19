import 'package:baghdad_fair/core/utilities/pagesFilters.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/companiesGuide/coGuideBloc.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/companiesGuide/coGuideEvents.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/manager/fairs/fairsBloc.dart';
import 'package:baghdad_fair/features/homeBody/fairs/presentation/manager/fairs/fairsEvents.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/manager/news/newsBloc.dart';
import 'package:baghdad_fair/features/homeBody/news/presentation/manager/news/newsEvents.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/manager/companies/companiesBloc.dart';
import 'package:baghdad_fair/features/homeBody/participatingCompanies/presentation/manager/companies/companiesEvents.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/presentation/manager/videos/videosBloc.dart';
import 'package:baghdad_fair/features/homeBody/videosLibrary/presentation/manager/videos/videosEvents.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

int newsPagination = 1;
int videosPagination = 1;
int fairsPagination = 1;
int parCompaniesPagination = 1;
int coGuidePagination = 1;
int adsPagination = 1;

bool isNewsLoading = false;
bool isVideosLoading = false;
bool isFairsLoading = false;
bool isParCompaniesLoading = false;
bool isCoGuideLoading = false;
bool isAdsLoading = false;

bool newsHasMore = true;
bool videosHasMore = true;
bool fairsHasMore = true;
bool parCompaniesHasMore = true;
bool coGuideHasMore = true;
bool adsHasMore = true;

void loadMore (int index,BuildContext context) {
  switch (index) {
    case 2: // News
      if (!isNewsLoading && newsHasMore) {
        isNewsLoading = true;
        context.read<NewsBloc>().add(GetNewsEvent(
          page: newsPagination + 1,
          isPagination: true,
          filter: newsFilter
        ));
      }
      newsPagination++;
      isNewsLoading = false;
      break;
    case 3: // Videos
      if (!isVideosLoading && videosHasMore) {
        isVideosLoading = true;
        context.read<VideosBloc>().add(GetVideosEvent(
          page: videosPagination + 1,
          isPagination: true,
          filter: videosFilter
        ));
      }
      videosPagination++;
      isVideosLoading = false;
      break;
    case 4: // Fairs
      if (!isFairsLoading && fairsHasMore) {
        isFairsLoading = true;
        context.read<FairsBloc>().add(GetFairsEvent(
          page: fairsPagination + 1,
          isPagination: true,
          filter: fairsFilter
        ));

      }
      fairsPagination++;
      isFairsLoading = false;
      break;
    case 6: // Participating companies
      if (!isParCompaniesLoading && parCompaniesHasMore) {
        isParCompaniesLoading = true;
        context.read<CompaniesBloc>().add(GetCompaniesEvent(
          page: parCompaniesPagination + 1,
          isPagination: true,
          filter: companiesFilter
        ));
      }
      parCompaniesPagination++;
      isParCompaniesLoading = false;
      break;
    case 7: // Companies guide
      if (!isCoGuideLoading && coGuideHasMore) {
        isCoGuideLoading = true;
        context.read<CompaniesGuideBloc>().add(GetCompaniesGuideEvent(
          page: coGuidePagination + 1,
          isPagination: true,
          filter: companiesGuideFilter
        ));

      }
      coGuidePagination++;
      isCoGuideLoading = false;
      break;
    case 9: // Ads
      if (!isAdsLoading && adsHasMore) {
        isAdsLoading = true;
        

      }
      adsPagination++;
      isAdsLoading = false;
      break;
  }

}