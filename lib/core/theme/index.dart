import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:bloc_booking/core/theme/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/data_sources/local_data_source.dart';
import '../../injection_container.dart';
import 'color_schemes.g.dart';

export 'app_css.dart';

Session session = Session();

class PreferencesHelper {
  static SharedPreferences? _preferences;

  // Function to get the SharedPreferences instance
  static Future<SharedPreferences> getInstance() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences!;
  }

  // Example of using SharedPreferences to set a value
  static Future<void> setStringValue(String key, String value) async {
    final prefs = await getInstance();
    await prefs.setString(key, value);
  }

  // Example of using SharedPreferences to get a value
  static Future<String?> getStringValue(String key) async {
    final prefs = await getInstance();

    return prefs.getString(key);
  }

  // Example of using SharedPreferences to set a bool value
  static Future<void> setBoolValue(String key, bool value) async {
    final prefs = await getInstance();
    await prefs.setBool(key, value);
  }

  bool? getBool(
    String key,
  ) {
    bool? isData;
    SharedPreferences.getInstance().then((prefs) {
      isData = prefs.getBool(key);
    });
    return isData!;
  }
}

PreferencesHelper helper = PreferencesHelper();

bool? isTheme = locator.get<LocalDataSource>().isTheme();

AppTheme get appTheme => (isTheme) ??
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
    ? AppTheme.fromType(ThemeType.dark)
    : AppTheme.fromType(ThemeType.light);

bool get isDarkMode => isTheme ??
        SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
    ? true
    : false;

ThemeMode get themeMode =>
    SchedulerBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark
        ? ThemeMode.system
        : isDarkMode == true
            ? ThemeMode.dark
            : ThemeMode.light;
