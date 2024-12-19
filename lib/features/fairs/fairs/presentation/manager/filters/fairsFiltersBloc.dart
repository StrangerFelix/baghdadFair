
import 'package:baghdad_fair/features/fairs/fairs/presentation/manager/filters/fairsFiltersEvents.dart';
import 'package:baghdad_fair/features/fairs/fairs/presentation/manager/filters/fairsFiltersStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


OverlayEntry? fairsDropdownSectionEntry;
OverlayEntry? fairsDropdownLocationsEntry;
OverlayEntry? fairsDropdownConditionEntry;

class FairsFiltersBloc extends Bloc<FairsFiltersEvent, FairsFiltersStates> {
  FairsFiltersBloc() : super(SectionFiltersInitial()) {
    on<FairsFiltersEvent>((event, emit) {
      if (event is SectionHideOverlaysEvent) {   
        if (event.entryName == 'section') {
          fairsDropdownLocationsEntry?.remove();
          fairsDropdownLocationsEntry = null;
          fairsDropdownConditionEntry?.remove();
          fairsDropdownConditionEntry = null;
        }
        if (event.entryName == 'condition') {
          fairsDropdownLocationsEntry?.remove();
          fairsDropdownLocationsEntry = null;
          fairsDropdownSectionEntry?.remove();
          fairsDropdownSectionEntry = null;
        }
        if (event.entryName == 'locations') {
          fairsDropdownConditionEntry?.remove();
          fairsDropdownConditionEntry = null;
          fairsDropdownSectionEntry?.remove();
          fairsDropdownSectionEntry = null;
        }
        if (event.entryName == 'all') {
          fairsDropdownConditionEntry?.remove();
          fairsDropdownConditionEntry = null;
          fairsDropdownSectionEntry?.remove();
          fairsDropdownSectionEntry = null;
          fairsDropdownLocationsEntry?.remove();
          fairsDropdownLocationsEntry = null;
        }
        emit(SectionFiltersChanged());
      }
    });
  }
}
