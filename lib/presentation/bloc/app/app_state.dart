part of 'app_bloc.dart';

class AppState extends Equatable {
   AppState({
    Language? selectedLanguage,
    AppThemeMode? selectedThemeMode,  bool? isTheme,
  })  : selectedLanguage = selectedLanguage ?? Language.english,
        selectedThemeMode = selectedThemeMode ?? AppThemeMode.system,
        isTheme = isTheme ??  SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
            ? true
            : false;

  final Language selectedLanguage;
  final AppThemeMode selectedThemeMode;
  final bool isTheme;

  @override
  List<Object> get props => [selectedLanguage, selectedThemeMode,isTheme];

  AppState copyWith(
      {Language? selectedLanguage, AppThemeMode? selectedThemeMode}) {
    return AppState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedThemeMode: selectedThemeMode ?? this.selectedThemeMode,
      isTheme: isTheme ,
    );
  }
}
