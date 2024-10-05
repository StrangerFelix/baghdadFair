import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersEvents.dart';
import 'package:baghdad_fair/features/homeBody/companiesGuide/presentation/manager/filters/coGuideFiltersStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


OverlayEntry? coGuideDropdownSectionEntry;
OverlayEntry? coGuideDropdownTypeEntry;
OverlayEntry? coGuideDropdownActivityEntry;

class CoGuideFiltersBloc extends Bloc<CoGuideFiltersEvent, CoGuideFiltersStates> {
  CoGuideFiltersBloc() : super(CoGuideFiltersInitial()) {
    on<CoGuideFiltersEvent>((event, emit) {
      if (event is SectionHideOverlaysEvent) {
        if (event.entryName == 'section') {
          coGuideDropdownTypeEntry?.remove();
          coGuideDropdownTypeEntry = null;
          coGuideDropdownActivityEntry?.remove();
          coGuideDropdownActivityEntry = null;
        }
        if (event.entryName == 'activity') {
          coGuideDropdownTypeEntry?.remove();
          coGuideDropdownTypeEntry = null;
          coGuideDropdownSectionEntry?.remove();
          coGuideDropdownSectionEntry = null;
        }
        if (event.entryName == 'type') {
          coGuideDropdownActivityEntry?.remove();
          coGuideDropdownActivityEntry = null;
          coGuideDropdownSectionEntry?.remove();
          coGuideDropdownSectionEntry = null;
        }
        if (event.entryName == 'all') {
          coGuideDropdownActivityEntry?.remove();
          coGuideDropdownActivityEntry = null;
          coGuideDropdownSectionEntry?.remove();
          coGuideDropdownSectionEntry = null;
          coGuideDropdownTypeEntry?.remove();
          coGuideDropdownTypeEntry = null;
        }
        emit(SectionFiltersChanged());
      }
    });
  }
}
