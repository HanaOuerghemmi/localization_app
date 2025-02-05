import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization_app/core/bloc/switch_language_cubit.dart';
import 'package:localization_app/core/model/language_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LanguageModel> langauges = [
    LanguageModel(
      locale: const Locale("fr"),
      countryFlag: "​🇨🇵",
      langaugeName: "Frensh",
    ),
    LanguageModel(
      locale: const Locale("en"),
      countryFlag: "🇺🇸",
      langaugeName: "English",
    )
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.hello,
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            BlocBuilder<SwitchLanguageCubit, SupportedLangauges>(
              builder: (context, state) {
                return DropdownButton(
                  hint: Text(
                    AppLocalizations.of(context)?.selectLanguageOfYourChoice ??
                        "Select langauge of your choice",
                  ),
                  items: langauges.map(
                    (e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Text(
                          "${e.countryFlag}   ${e.langaugeName}",
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (value) {
                    context.read<SwitchLanguageCubit>().switchLangage(value!);
                  },
                );
              },
            ),
            Text(AppLocalizations.of(context)!.delete),
          ],
        
        ),
      ),
    );
  }
}