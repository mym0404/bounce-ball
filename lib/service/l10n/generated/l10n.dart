// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `en`
  String get _locale {
    return Intl.message(
      'en',
      name: '_locale',
      desc: '',
      args: [],
    );
  }

  /// `Bounce Ball`
  String get app_name {
    return Intl.message(
      'Bounce Ball',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Bounce your ball\nReach the Goal\nAnd, explore infinity space`
  String get ready_dv_description {
    return Intl.message(
      'Bounce your ball\nReach the Goal\nAnd, explore infinity space',
      name: 'ready_dv_description',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting_title {
    return Intl.message(
      'Settings',
      name: 'setting_title',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get g_start {
    return Intl.message(
      'Start',
      name: 'g_start',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get g_okay {
    return Intl.message(
      'Okay',
      name: 'g_okay',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get g_cancel {
    return Intl.message(
      'Cancel',
      name: 'g_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get g_total {
    return Intl.message(
      'Total',
      name: 'g_total',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get g_clear {
    return Intl.message(
      'Clear',
      name: 'g_clear',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get g_confirm {
    return Intl.message(
      'Confirm',
      name: 'g_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Stage`
  String get g_stage {
    return Intl.message(
      'Stage',
      name: 'g_stage',
      desc: '',
      args: [],
    );
  }

  /// `Level`
  String get g_level {
    return Intl.message(
      'Level',
      name: 'g_level',
      desc: '',
      args: [],
    );
  }

  /// `World`
  String get g_world {
    return Intl.message(
      'World',
      name: 'g_world',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get g_score {
    return Intl.message(
      'Score',
      name: 'g_score',
      desc: '',
      args: [],
    );
  }

  /// `Death`
  String get g_death {
    return Intl.message(
      'Death',
      name: 'g_death',
      desc: '',
      args: [],
    );
  }

  /// `Bounce`
  String get g_bounce {
    return Intl.message(
      'Bounce',
      name: 'g_bounce',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get g_time {
    return Intl.message(
      'Time',
      name: 'g_time',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get g_share {
    return Intl.message(
      'Share',
      name: 'g_share',
      desc: '',
      args: [],
    );
  }

  /// `Ranking`
  String get g_ranking {
    return Intl.message(
      'Ranking',
      name: 'g_ranking',
      desc: '',
      args: [],
    );
  }

  /// `Register Ranking`
  String get register_ranking {
    return Intl.message(
      'Register Ranking',
      name: 'register_ranking',
      desc: '',
      args: [],
    );
  }

  /// `Ranking Registering...`
  String get register_ranking_start {
    return Intl.message(
      'Ranking Registering...',
      name: 'register_ranking_start',
      desc: '',
      args: [],
    );
  }

  /// `Ranking Registered!`
  String get register_ranking_done {
    return Intl.message(
      'Ranking Registered!',
      name: 'register_ranking_done',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occured!`
  String get g_error {
    return Intl.message(
      'Unknown error occured!',
      name: 'g_error',
      desc: '',
      args: [],
    );
  }

  /// `No Data Yet`
  String get g_empty_title {
    return Intl.message(
      'No Data Yet',
      name: 'g_empty_title',
      desc: '',
      args: [],
    );
  }

  /// `Explore infinity space`
  String get g_empty_body {
    return Intl.message(
      'Explore infinity space',
      name: 'g_empty_body',
      desc: '',
      args: [],
    );
  }

  /// `We are waiting...`
  String get g_loading_title {
    return Intl.message(
      'We are waiting...',
      name: 'g_loading_title',
      desc: '',
      args: [],
    );
  }

  /// `Where to go?`
  String get g_loading_body {
    return Intl.message(
      'Where to go?',
      name: 'g_loading_body',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get __ {
    return Intl.message(
      '',
      name: '__',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
