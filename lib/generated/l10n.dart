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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Medicine `
  String get appName {
    return Intl.message('Medicine ', name: 'appName', desc: '', args: []);
  }

  /// `Reminder`
  String get appName1 {
    return Intl.message('Reminder', name: 'appName1', desc: '', args: []);
  }

  /// `Your medicines, on time.`
  String get splashTitle {
    return Intl.message(
      'Your medicines, on time.',
      name: 'splashTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Medicines and\nSet Reminders`
  String get onboardingPage1Title {
    return Intl.message(
      'Add Your Medicines and\nSet Reminders',
      name: 'onboardingPage1Title',
      desc: '',
      args: [],
    );
  }

  /// `Get Reminders\nat the Right Time`
  String get onboardingPage2Title {
    return Intl.message(
      'Get Reminders\nat the Right Time',
      name: 'onboardingPage2Title',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Progress`
  String get onboardingPage3Title {
    return Intl.message(
      'Track Your Progress',
      name: 'onboardingPage3Title',
      desc: '',
      args: [],
    );
  }

  /// `Keep track of your medications and\nschedule your dose times with ease.`
  String get onboardingPage1Subtitle {
    return Intl.message(
      'Keep track of your medications and\nschedule your dose times with ease.',
      name: 'onboardingPage1Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Receive notifications for your doses, so\nyou never miss your medicine.`
  String get onboardingPage2Subtitle {
    return Intl.message(
      'Receive notifications for your doses, so\nyou never miss your medicine.',
      name: 'onboardingPage2Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Review your medication history and understand\nyour daily adherence with effortless visual\nsummaries.`
  String get onboardingPage3Subtitle {
    return Intl.message(
      'Review your medication history and understand\nyour daily adherence with effortless visual\nsummaries.',
      name: 'onboardingPage3Subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `You haven't added any medicines yet. Add your first medicine to start tracking your doses.`
  String get noMedicinesYetDescription {
    return Intl.message(
      'You haven\'t added any medicines yet. Add your first medicine to start tracking your doses.',
      name: 'noMedicinesYetDescription',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Analytics`
  String get analytics {
    return Intl.message('Analytics', name: 'analytics', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `No Medicines Yet`
  String get noMedicinesYet {
    return Intl.message(
      'No Medicines Yet',
      name: 'noMedicinesYet',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Details`
  String get medicineDetails {
    return Intl.message(
      'Medicine Details',
      name: 'medicineDetails',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Name`
  String get medicineName {
    return Intl.message(
      'Medicine Name',
      name: 'medicineName',
      desc: '',
      args: [],
    );
  }

  /// `Enter medicine name`
  String get enterMedicineName {
    return Intl.message(
      'Enter medicine name',
      name: 'enterMedicineName',
      desc: '',
      args: [],
    );
  }

  /// `Dose Amount`
  String get doseAmount {
    return Intl.message('Dose Amount', name: 'doseAmount', desc: '', args: []);
  }

  /// `Food Instructions`
  String get foodInstructions {
    return Intl.message(
      'Food Instructions',
      name: 'foodInstructions',
      desc: '',
      args: [],
    );
  }

  /// `No Instruction`
  String get noInstruction {
    return Intl.message(
      'No Instruction',
      name: 'noInstruction',
      desc: '',
      args: [],
    );
  }

  /// `Before Food`
  String get beforeFood {
    return Intl.message('Before Food', name: 'beforeFood', desc: '', args: []);
  }

  /// `After Food`
  String get afterFood {
    return Intl.message('After Food', name: 'afterFood', desc: '', args: []);
  }

  /// `With Food`
  String get withFood {
    return Intl.message('With Food', name: 'withFood', desc: '', args: []);
  }

  /// `Enter your medicine information and schedule.`
  String get enterMedicineInformationAndSchedule {
    return Intl.message(
      'Enter your medicine information and schedule.',
      name: 'enterMedicineInformationAndSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Add Medicine`
  String get addMedicine {
    return Intl.message(
      'Add Medicine',
      name: 'addMedicine',
      desc: '',
      args: [],
    );
  }

  /// `Medicine Information`
  String get medicineInformation {
    return Intl.message(
      'Medicine Information',
      name: 'medicineInformation',
      desc: '',
      args: [],
    );
  }

  /// `On an empty stomach`
  String get emptyStomach {
    return Intl.message(
      'On an empty stomach',
      name: 'emptyStomach',
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
      Locale.fromSubtags(languageCode: 'ar'),
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
