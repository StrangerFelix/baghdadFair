import 'package:baghdad_fair/features/home/data/models/homeModel.dart';

abstract class HomeStates {}
class HomeInitial extends HomeStates {}

class HomeLoading extends HomeStates {}
class HomeLoaded extends HomeStates {
  final HomeModel model;
  HomeLoaded(this.model);
}
class HomeFailure extends HomeStates {
  final String error;
  HomeFailure(this.error);
}