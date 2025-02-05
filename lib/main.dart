import 'package:flutter/material.dart';
import 'package:localization_app/core/bloc/switch_language_cubit.dart';
import 'package:localization_app/core/services/user_language_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localization_app/features/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserLanguageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SwitchLanguageCubit(),
      child: BlocBuilder<SwitchLanguageCubit, SupportedLangauges>(
          builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
         locale: Locale(UserLanguageService.getPreferredLangauge),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        );
      }),
    );
  }
}
