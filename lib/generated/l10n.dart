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

  /// `Medical App`
  String get appName {
    return Intl.message(
      'Medical App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Vitals`
  String get vitals {
    return Intl.message(
      'Vitals',
      name: 'vitals',
      desc: '',
      args: [],
    );
  }

  /// `Blood Oxygen`
  String get bloodOxygen {
    return Intl.message(
      'Blood Oxygen',
      name: 'bloodOxygen',
      desc: '',
      args: [],
    );
  }

  /// `Blood Group`
  String get bloodGroup {
    return Intl.message(
      'Blood Group',
      name: 'bloodGroup',
      desc: '',
      args: [],
    );
  }

  /// `Blood Pressure`
  String get bloodPressure {
    return Intl.message(
      'Blood Pressure',
      name: 'bloodPressure',
      desc: '',
      args: [],
    );
  }

  /// `Body Weight`
  String get bodyWeight {
    return Intl.message(
      'Body Weight',
      name: 'bodyWeight',
      desc: '',
      args: [],
    );
  }

  /// `Respiratory Rate`
  String get respiratoryRate {
    return Intl.message(
      'Respiratory Rate',
      name: 'respiratoryRate',
      desc: '',
      args: [],
    );
  }

  /// `Body Temperator`
  String get bodyTemp {
    return Intl.message(
      'Body Temperator',
      name: 'bodyTemp',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Generation`
  String get general {
    return Intl.message(
      'Generation',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Resting`
  String get resting {
    return Intl.message(
      'Resting',
      name: 'resting',
      desc: '',
      args: [],
    );
  }

  /// `After Exercise`
  String get afterExercise {
    return Intl.message(
      'After Exercise',
      name: 'afterExercise',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Before Exercise' key

  /// `Excited`
  String get excited {
    return Intl.message(
      'Excited',
      name: 'excited',
      desc: '',
      args: [],
    );
  }

  /// `Select Photo`
  String get selectPhoto {
    return Intl.message(
      'Select Photo',
      name: 'selectPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Take a Photo`
  String get takeAPhoto {
    return Intl.message(
      'Take a Photo',
      name: 'takeAPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get manual {
    return Intl.message(
      'Manual',
      name: 'manual',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Week`
  String get week {
    return Intl.message(
      'Week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get Month {
    return Intl.message(
      'Month',
      name: 'Month',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `All Time`
  String get allTime {
    return Intl.message(
      'All Time',
      name: 'allTime',
      desc: '',
      args: [],
    );
  }

  /// `SpO₂`
  String get spo2 {
    return Intl.message(
      'SpO₂',
      name: 'spo2',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message(
      'Age',
      name: 'age',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
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
