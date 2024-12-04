
class FairsFiltersEvent {}

class SectionHideOverlaysEvent extends FairsFiltersEvent {
  final String entryName;
  SectionHideOverlaysEvent(this.entryName);
}
