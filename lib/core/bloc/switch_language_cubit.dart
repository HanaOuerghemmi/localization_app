import 'package:bloc/bloc.dart';
import 'package:localization_app/core/constants/app_constants.dart';
import 'package:localization_app/core/model/language_model.dart';
import 'package:localization_app/core/services/user_language_service.dart';

enum SupportedLangauges {
  english,
  frensh,
}

class SwitchLanguageCubit extends Cubit<SupportedLangauges> {
  SwitchLanguageCubit() : super(SupportedLangauges.english); // initial state is app language state is english
  void switchLangage(LanguageModel language) async {
    await UserLanguageService.setpreferredLangauge(language.locale);
    switch (language.locale.languageCode) {
      case AppConstants.englishLanguageCode:
        emit(SupportedLangauges.english);
        break;
      case AppConstants.frenshLanguageCode:
        emit(SupportedLangauges.frensh);
        break;
      
      default:
        emit(SupportedLangauges.english);
    }
  }
}