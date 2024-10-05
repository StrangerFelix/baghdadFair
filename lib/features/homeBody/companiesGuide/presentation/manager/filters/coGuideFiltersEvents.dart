
class CoGuideFiltersEvent {}

class SectionHideOverlaysEvent extends CoGuideFiltersEvent {
  final String entryName;
  SectionHideOverlaysEvent(this.entryName);
}
