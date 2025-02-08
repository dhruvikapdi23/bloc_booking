import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class AppTheme {
  static ThemeType defaultTheme = ThemeType.light;

  //Theme Colors
  bool isDark;
  Color primary;
  Color secondary;
  Color white;
  Color black;
  Color bgLight;
  Color greyText;
  Color lightGrey;
  Color textBoxBorderGrey;
  Color green;
  Color lightGreen;
  Color red;
  Color bdrClr;
  Color alertClr;
  Color alertTextClr;
  Color nero;
  Color trans;
  Color darkOrange;
  Color iosButtonColor;
  Color lightRed;
  Color checkInColor;
  Color pendingColor;
  Color infoColor;
  Color infoLightColor;

  /// Default constructor
  AppTheme({
    required this.isDark,
    required this.primary,
    required this.secondary,
    required this.white,
    required this.black,
    required this.bgLight,
    required this.greyText,
    required this.lightGrey,
    required this.textBoxBorderGrey,
    required this.green,
    required this.lightGreen,
    required this.red,
    required this.bdrClr,
    required this.alertClr,
    required this.alertTextClr,
    required this.nero,
    required this.trans,
    required this.darkOrange,
    required this.iosButtonColor,
    required this.lightRed,
    required this.checkInColor,
    required this.pendingColor,
    required this.infoColor,
    required this.infoLightColor,
  });

  /// fromType factory constructor
  factory AppTheme.fromType(ThemeType t) {
    switch (t) {
      case ThemeType.light:
        return AppTheme(
          isDark: false,
          primary: const Color(0xFF2667FF),
          secondary: const Color(0xFF0F172A),
          white: const Color(0xFFFFFFFF),
          black: const Color(0xFF000000),
          bgLight: const Color(0xFFF8FAFC),
          greyText: const Color(0xFF64758B),
          lightGrey: const Color(0xFFCBD5E1),
          textBoxBorderGrey: const Color(0xFF94A3B8),
          green: const Color(0xFF17803D),
          lightGreen: const Color(0xFFDCFCE7),
          red: const Color(0xFFEF4444),
          bdrClr: const Color(0xFFF1F5F9),
          alertClr: const Color(0xFFFEF9C3),
          alertTextClr: const Color(0xFFA16207),
          nero: const Color(0xFF222222),
          trans: Colors.transparent,
          darkOrange: const Color(0xFFA16207),
          iosButtonColor: const Color(0xFF007AFF),
          lightRed: const Color(0xFFFEE2E1),
          checkInColor: const Color(0xFF22C55D),
          pendingColor: const Color(0xFFEBB305),
          infoColor: const Color(0xFF5185FF),
          infoLightColor: const Color(0xFFE9F0FF),
        );

    // TODO: Handle this case.
      case ThemeType.dark:
        return AppTheme(
          isDark: true,
          primary: const Color(0xFF2667FF),
          secondary: const Color(0xFF0F172A),
          white: const Color(0xFF000000),
          black: const Color(0xFF000000),
          bgLight: const Color(0xFFF8FAFC),
          greyText: const Color(0xFF64758B),
          lightGrey: const Color(0xFFCBD5E1),
          textBoxBorderGrey: const Color(0xFF94A3B8),
          green: const Color(0xFF17803D),
          lightGreen: const Color(0xFFDCFCE7),
          red: const Color(0xFFEF4444),
          bdrClr: const Color(0xFFF1F5F9),
          alertClr: const Color(0xFFFEF9C3),
          alertTextClr: const Color(0xFFA16207),
          nero: const Color(0xFF222222),
          trans: Colors.transparent,
          darkOrange: const Color(0xFFA16207),
          iosButtonColor: const Color(0xFF007AFF),
          lightRed: const Color(0xFFFEE2E1),
          checkInColor: const Color(0xFF22C55D),
          pendingColor: const Color(0xFFEBB305),
          infoColor: const Color(0xFF5185FF),
          infoLightColor: const Color(0xFFE9F0FF),
        );
    // TODO: Handle this case.
    }
  }

  ThemeData get themeData {
    var t = ThemeData.from(
      textTheme: (isDark ? ThemeData.dark() : ThemeData.light()).textTheme,
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: isDark ? Brightness.dark : Brightness.light,
        primary: primary,
        secondary: primary,
        surface: white,
        onSurface: white,
        onError: Colors.red,
        onPrimary: primary,
        tertiary: white,
        onInverseSurface: white,
        tertiaryContainer: white,
        surfaceTint: white,
        surfaceContainerHighest: white,
        onSecondary: primary,
        error: Colors.red,
      ),
    );
    return t.copyWith(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Colors.transparent, cursorColor: primary),
      buttonTheme: ButtonThemeData(buttonColor: primary),
      highlightColor: primary,
    );
  }
}
