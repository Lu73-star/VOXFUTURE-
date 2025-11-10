import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

class LanguageLoader {
  final Locale locale;

  LanguageLoader(this.locale);

  static const List<String> supportedLanguages = ['pt', 'en', 'es', 'fr', 'de'];

  static Future<LanguageLoader> load(Locale locale) async {
    return LanguageLoader(locale);
  }

  static const LocalizationsDelegate<LanguageLoader> delegate =
      _LanguageLoaderDelegate();

  Map<String, String>? _sentences;

  Future<void> loadTranslations() async {
    final String langCode = supportedLanguages.contains(locale.languageCode)
        ? locale.languageCode
        : 'en';

    final String data =
        await rootBundle.loadString('assets/translations/$langCode.json');

    final Map<String, dynamic> result = json.decode(data);

    _sentences = result.map((key, value) => MapEntry(key, value.toString()));
  }

  String translate(String key) {
    return _sentences?[key] ?? key;
  }

  static const List<Locale> supportedLocales = [
    Locale('pt', 'BR'),
    Locale('en', 'US'),
    Locale('es', 'ES'),
    Locale('fr', 'FR'),
    Locale('de', 'DE'),
  ];
}

class _LanguageLoaderDelegate extends LocalizationsDelegate<LanguageLoader> {
  const _LanguageLoaderDelegate();

  @override
  bool isSupported(Locale locale) {
    return LanguageLoader.supportedLanguages.contains(locale.languageCode);
  }

  @override
  Future<LanguageLoader> load(Locale locale) async {
    final loader = LanguageLoader(locale);
    await loader.loadTranslations();
    return loader;
  }

  @override
  bool shouldReload(_LanguageLoaderDelegate old) => false;
}
