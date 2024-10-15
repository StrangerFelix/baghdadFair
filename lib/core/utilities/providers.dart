import 'package:baghdad_fair/core/utilities/serviceLocator.dart';
import 'package:baghdad_fair/features/home/presentation/managers/language/languageCubit.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/data/repository/aboutUsRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/manager/aboutUs/aboutUsBloc.dart';
import 'package:baghdad_fair/features/homeBody/aboutUs/presentation/manager/aboutUs/aboutUsEvents.dart';
import 'package:baghdad_fair/features/homeBody/home/data/repository/homeRepoImpl.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/home/homeBloc.dart';
import 'package:baghdad_fair/features/homeBody/home/presentation/manager/home/homeEvents.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:nested/nested.dart';

List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => LanguageCubit(),),
  BlocProvider(create: (context) => HomeBloc(getIt.get<HomeRepositoryImplementation>())..add(GetHomeDataEvent()),),
  BlocProvider(create: (context) => AboutUsBloc(getIt.get<AboutUsRepositoryImplementation>())..add(GetAboutUsEvent()),),
];
