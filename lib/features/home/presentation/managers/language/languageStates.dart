part of 'languageCubit.dart';

@immutable
sealed class LanguageStates {}

class LanguageInitial extends LanguageStates {}
class LanguageChanged extends LanguageStates {}
