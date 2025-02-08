import 'dart:ui';


enum Language {
  english(Locale('en', 'US'), 'English'),
  hindi(Locale('hi', 'IN'), 'Hindi'),
  gujarati(Locale('gu', 'IN'), 'Gujarati');

  const Language(this.value, this.text);

  final Locale value;
  final String text;
}
