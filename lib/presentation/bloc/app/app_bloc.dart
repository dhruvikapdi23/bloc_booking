import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/app_theme_mode.dart';
import '../../../core/enums/language.dart';
import '../../../data/data_sources/local_data_source.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final LocalDataSource localDataSource;

  AppBloc({required this.localDataSource}) : super( AppState()) {
    on<OnAppInit>(onAppInit);
    on<ChangeLanguage>(onChangeLanguage);
    on<ChangeThemeMode>(onChangeThemeMode);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<AppState> emit) async {
    await localDataSource
        .cacheLanguage(event.selectedLanguage.value.languageCode);
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  onChangeThemeMode(ChangeThemeMode event, Emitter<AppState> emit) async {
    await localDataSource.cacheThemeMode(event.selectedThemeMode.value.name);
    emit(state.copyWith(selectedThemeMode: event.selectedThemeMode));
  }

  onAppInit(OnAppInit event, Emitter<AppState> emit) async {
    final selectedLanguage = localDataSource.getLanguage();
    final selectedThemeMode = localDataSource.getThemeMode();

    emit(state.copyWith(
      selectedLanguage: selectedLanguage != null
          ? Language.values
              .where((item) => item.value.languageCode == selectedLanguage)
              .first
          : Language.english,
      selectedThemeMode: selectedThemeMode != null
          ? AppThemeMode.values
              .where((themeMode) => themeMode.value.name == selectedThemeMode)
              .first
          : AppThemeMode.system,

    ));
  }
}
