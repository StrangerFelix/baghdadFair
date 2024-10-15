// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'package:baghdad_fair/core/utilities/appCache.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'languageStates.dart';

class LanguageCubit extends Cubit<LanguageStates> {
  LanguageCubit() : super(LanguageInitial());
  Locale? locale;
  Locale? getLocale() {
    String checkCachedLanguage = CacheHelper.getData(key: 'lang') ?? 'ar';
    return locale ?? Locale(checkCachedLanguage);
  }
  
  Future<void> changeLanguage(String language) async{
    if (language == "English") {
      await CacheHelper.saveData(key: 'lang', value: 'en');
      locale = Locale('en');
    } else {
      await CacheHelper.saveData(key: 'lang', value: 'ar');
      locale = Locale('ar');
    }
    emit(LanguageChanged());
  }
}
