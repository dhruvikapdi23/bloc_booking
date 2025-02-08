import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/enums/app_theme_mode.dart';
import '../../core/error/exceptions.dart';

abstract class LocalDataSource {

  Future<bool> isLogin();

  Future<bool> isIntro();

  bool isTheme();

  String? getAuthToken();

  String? getUser();

  Future<void> removeAuthToken();

  Future<void> removeUser();

  Future<void> cacheUser(String user);

  Future<void> cacheAuthToken(String authToken);

  Future<void> cacheLanguage(String languageCode);

  String? getLanguage();

  Future<void> cacheThemeMode(String themeModeName);

  String? getThemeMode();
}

const _authToken = "authToken";
const _isIntro = "isIntro";
const _user = "user";
const _languagePrefs = "languagePrefs";
const _themePrefs = "themePrefs";

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> isLogin() {
    try {
      final String? jsonString = sharedPreferences.getString(_authToken);
      if (jsonString != null) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } on Exception catch (e) {
      throw RemoteException(statusCode: e.hashCode, message: e.toString());
    }
  }

  @override
  Future<bool> isIntro() {
    try {
      final bool? jsonString = sharedPreferences.getBool(_isIntro);
      if (jsonString != null) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } on Exception catch (e) {
      throw RemoteException(statusCode: e.hashCode, message: e.toString());
    }
  }

  @override
  bool isTheme() {
    try {
      final String? jsonString = sharedPreferences.getString(_themePrefs);
      if (jsonString != null) {
        AppThemeMode appThemeMode = AppThemeMode.values
            .where((themeMode) => themeMode.value.name == jsonString)
            .first;
        ThemeMode themeMode = appThemeMode.value;
        bool isDark = themeMode == ThemeMode.system
            ? SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.dark
                ? true
                : false
            : themeMode == ThemeMode.dark
                ? true
                : false;
        return isDark;
      } else {
        return false;
      }
    } on Exception catch (e) {
      throw RemoteException(statusCode: e.hashCode, message: e.toString());
    }
  }

  @override
  Future<void> cacheAuthToken(String authToken) {
    return sharedPreferences.setString(_authToken, authToken);
  }

  @override
  Future<void> cacheUser(String user) {
    return sharedPreferences.setString(_user, user);
  }

  @override
  Future<void> cacheLanguage(String languageCode) {
    return sharedPreferences.setString(_languagePrefs, languageCode);
  }

  @override
  Future<void> cacheThemeMode(String themeModeName) {
    return sharedPreferences.setString(_themePrefs, themeModeName);
  }

  @override
  Future<void> removeAuthToken() {
    return sharedPreferences.remove(_authToken);
  }

  @override
  Future<void> removeUser() {
    return sharedPreferences.remove(_user);
  }

  @override
  String? getAuthToken() {
    try {
      final String? jsonString = sharedPreferences.getString(_authToken);
      return jsonString;
    } on Exception catch (e) {
      throw RemoteException(statusCode: e.hashCode, message: e.toString());
    }
  }

  @override
  String? getUser() {
    try {
      final String? jsonString = sharedPreferences.getString(_user);
      return jsonString;
    } on Exception catch (e) {
      throw RemoteException(statusCode: e.hashCode, message: e.toString());
    }
  }

  @override
  String? getLanguage() {
    try {
      final String? jsonString = sharedPreferences.getString(_languagePrefs);
      return jsonString;
    } on Exception catch (e) {
      throw RemoteException(statusCode: e.hashCode, message: e.toString());
    }
  }

  @override
  String? getThemeMode() {
    try {
      final String? jsonString = sharedPreferences.getString(_themePrefs);
      return jsonString;
    } on Exception catch (e) {
      throw RemoteException(statusCode: e.hashCode, message: e.toString());
    }
  }
}
