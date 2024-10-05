import 'package:baghdad_fair/core/utilities/appCache.dart';
import 'package:baghdad_fair/core/utilities/appRouter.dart';
import 'package:baghdad_fair/core/utilities/appStyles.dart';
import 'package:baghdad_fair/features/home/presentation/managers/language/languageCubit.dart';
import 'package:baghdad_fair/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageStates>(
        builder: (context, state) {
          return MaterialApp.router(
            locale: BlocProvider.of<LanguageCubit>(context).getLocale(),
            title: 'Baghdad Fair',
            debugShowCheckedModeBanner: false,
            theme: AppStyles.lightTheme,
            darkTheme: AppStyles.darkTheme,
            themeMode: ThemeMode.light,
            routerConfig: AppRouter.router,
            localizationsDelegates: const [
              S.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}