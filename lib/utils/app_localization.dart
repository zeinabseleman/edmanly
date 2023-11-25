import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;
  late Map<String, dynamic> _phrases;

  AppLocalization(this.locale);

  // Getter of Localization
  static AppLocalization of(BuildContext context) =>
      Localizations.of<AppLocalization>(context, AppLocalization)!;
  static AppLocalization get instance => AppLocalizationsDelegate.instance;

  // Data Loader
  Future<bool> load() async {
    String data = await rootBundle
        .loadString('assets/lang/${locale.languageCode}.json');
    _phrases = json.decode(data);
    return true;
  }

  // Localize Some Text
  String translate(String key) {
    return _phrases[key] ?? key;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationsDelegate();
  static late AppLocalization instance;

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localizations = AppLocalization(locale);
    await localizations.load();
    log("Load -> ${locale.languageCode}");
    instance = localizations;
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
