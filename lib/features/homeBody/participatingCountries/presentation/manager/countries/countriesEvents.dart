abstract class CountriesEvents {}

class GetCountriesEvent extends CountriesEvents {
  final String filter;
  GetCountriesEvent({this.filter = ''});
}