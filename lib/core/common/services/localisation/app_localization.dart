import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:logging/logging.dart';

class AppLocalization {
  AppLocalization(this.preferences);

  static const tag = 'AppLocalization';

  static const localeCodeEn = 'en';
  static const localeCodeEs = 'es';

  static const localeNameEn = 'English';
  static const localeNameEs = 'Spanish';

  static const localeEn = Locale(localeCodeEn);
  static const localeEs = Locale(localeCodeEs);

  static const supportedLocales = <Locale>[localeEn, localeEs];

  static const languageCodes = <String>[localeCodeEn, localeCodeEs];

  static const supportedLocaleNames = <String>[localeNameEn, localeNameEs];

  static const delegate = AppLocalizationsDelegate();

  static const delegates = <LocalizationsDelegate<Object>>[
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    AppLocalization.delegate, // Add this line
  ];
  final Logger _logger = Logger(tag);
  final PreferenceManager preferences;

  Language of(BuildContext context) {
    final localisation = Localizations.of<Language>(context, Language);
    return localisation ?? English();
  }

  Future<bool> setAppLocale(Locale locale) async {
    _logger.fine('setLocale locale:$locale');
    try {
      await preferences.setLanguage(locale.languageCode);
    } catch (error, st) {
      _logger.severe('setAppLocale: $error', null, st);
      return false;
    }
    return true;
  }

  Future<Locale> getAppLocale() async {
    final currentAppLocale = await preferences.getLanguage();
    return Locale(currentAppLocale);
  }

  Future<String> getAppLocaleName() async {
    final appLocale = await getAppLocale();
    final name = supportedLocaleNames.firstWhere(
      (element) => element.toLowerCase().startsWith(appLocale.languageCode),
    );
    return name;
  }

  String getSystemLocale() {
    final systemLocale = Platform.localeName;
    _logger.fine('getSystemLocale $systemLocale');
    final validatedSystemLocale =
        _checkIfSystemLocaleIsSupportedByApp(systemLocale);
    return validatedSystemLocale;
  }

  String _checkIfSystemLocaleIsSupportedByApp(String systemLocale) {
    final appSupportedLocaleThatMatchesSystem = supportedLocales
        .firstWhere((element) => systemLocale == element.languageCode);
    return appSupportedLocaleThatMatchesSystem.languageCode;
  }

  Future<void> clearLocale() async {
    await preferences.clearLanguage();
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<Language> {
  // final Logger _logger = Logger("_AppLocalizationsDelegate");

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // _logger.fine("isSupported locale ${locale.languageCode}");
    final result = AppLocalization.languageCodes.contains(locale.languageCode);
    // _logger.fine("isSupported $result");
    return result;
  }

  @override
  Future<Language> load(Locale locale) => _load(locale);

  Future<Language> _load(Locale locale) async {
    switch (locale.languageCode) {
      case AppLocalization.localeCodeEn:
        return sl<English>();
      default:
        return sl<Spanish>();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Language> old) => false;
}
