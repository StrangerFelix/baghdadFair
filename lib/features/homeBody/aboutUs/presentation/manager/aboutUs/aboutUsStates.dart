import 'package:baghdad_fair/features/homeBody/aboutUs/data/models/aboutUsModel.dart';

abstract class AboutUsStates {}
class AboutUsInitial extends AboutUsStates {}

class AboutUsLoading extends AboutUsStates {}
class AboutUsLoaded extends AboutUsStates {
  final AboutUsModel model;
  AboutUsLoaded(this.model);
}
class AboutUsFailure extends AboutUsStates {
  final String error;
  AboutUsFailure(this.error);
}