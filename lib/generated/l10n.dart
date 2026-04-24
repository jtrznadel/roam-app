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

  /// `marmo - Your mountaineer's journal`
  String get appTitle {
    return Intl.message(
      'marmo - Your mountaineer\'s journal',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeTabLabel {
    return Intl.message('Home', name: 'homeTabLabel', desc: '', args: []);
  }

  /// `Map`
  String get mapTabLabel {
    return Intl.message('Map', name: 'mapTabLabel', desc: '', args: []);
  }

  /// `Peaks`
  String get peaksTabLabel {
    return Intl.message('Peaks', name: 'peaksTabLabel', desc: '', args: []);
  }

  /// `Profile`
  String get profileTabLabel {
    return Intl.message('Profile', name: 'profileTabLabel', desc: '', args: []);
  }

  /// `Every Peak Becomes An Achievement`
  String get landingPageTitle {
    return Intl.message(
      'Every Peak Becomes An Achievement',
      name: 'landingPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continueWithApple {
    return Intl.message(
      'Continue with Apple',
      name: 'continueWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Continue with E-mail`
  String get continueWithEmail {
    return Intl.message(
      'Continue with E-mail',
      name: 'continueWithEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `By continuing, you agree to the\n`
  String get landingTermsText {
    return Intl.message(
      'By continuing, you agree to the\n',
      name: 'landingTermsText',
      desc: '',
      args: [],
    );
  }

  /// ` & `
  String get and {
    return Intl.message(' & ', name: 'and', desc: '', args: []);
  }

  /// `Terms`
  String get terms {
    return Intl.message('Terms', name: 'terms', desc: '', args: []);
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Enter your E-mail`
  String get continueWithEmailHeadline {
    return Intl.message(
      'Enter your E-mail',
      name: 'continueWithEmailHeadline',
      desc: '',
      args: [],
    );
  }

  /// `We would like to send you a verification code, which will allow you to continue.`
  String get continueWithEmailSubheadline {
    return Intl.message(
      'We would like to send you a verification code, which will allow you to continue.',
      name: 'continueWithEmailSubheadline',
      desc: '',
      args: [],
    );
  }

  /// `Check your inbox`
  String get otpHeadline {
    return Intl.message(
      'Check your inbox',
      name: 'otpHeadline',
      desc: '',
      args: [],
    );
  }

  /// `We have sent a 4-digit verification code`
  String get otpSubheadline {
    return Intl.message(
      'We have sent a 4-digit verification code',
      name: 'otpSubheadline',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get otpResend {
    return Intl.message('Resend code', name: 'otpResend', desc: '', args: []);
  }

  /// `Resend code in {seconds}s`
  String otpResendTimer(Object seconds) {
    return Intl.message(
      'Resend code in ${seconds}s',
      name: 'otpResendTimer',
      desc: '',
      args: [seconds],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pl'),
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
