import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  // Initialization
  AppLocalizations(this.locale);

  // Static Properties
  static const delegate = _AppLocalizationsDelegate();
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'EG'),
  ];

  // Public Properties
  final Locale locale;

  // Private Properties
  Map<String, String>? _localizedStrings;

  // Static Methods
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    )!;
  }

  static AppLocalizations get instance => _AppLocalizationsDelegate.instance;

  static String get currentLocale => instance.locale.languageCode;
  static bool get isRtl => instance.locale.languageCode == 'ar';

  Future<void> load() => rootBundle
      .loadString('assets/translations/${locale.languageCode.toLowerCase()}.json')
      .then((value) => json.decode(value))
      .then((json) => _mapJsonToLocalizedStrings(json));

  String trans (String key) => _localizedStrings?[key] ?? key;

  // Private Methods
  void _mapJsonToLocalizedStrings(Map<String, dynamic> json) {
    _localizedStrings = json.map(
      (key, value) => MapEntry(key, value.toString()),
    );
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.supportedLocales
      .map((e) => e.languageCode)
      .contains(locale.languageCode);

  static late AppLocalizations instance;

  @override
  Future<AppLocalizations> load(Locale locale) {
    final localizations = AppLocalizations(locale);

    instance = localizations;
    return localizations.load().then((value) => localizations);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
