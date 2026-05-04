// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(seconds) => "Resend code in ${seconds}s";

  static String m1(value) =>
      "We have sent a 6-digit verification code to ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "and": MessageLookupByLibrary.simpleMessage(" & "),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "marmo - Your mountaineer\'s journal",
    ),
    "continueLabel": MessageLookupByLibrary.simpleMessage("Continue"),
    "continueWithApple": MessageLookupByLibrary.simpleMessage(
      "Continue with Apple",
    ),
    "continueWithEmail": MessageLookupByLibrary.simpleMessage(
      "Continue with E-mail",
    ),
    "continueWithEmailHeadline": MessageLookupByLibrary.simpleMessage(
      "Enter your e-mail",
    ),
    "continueWithEmailSubheadline": MessageLookupByLibrary.simpleMessage(
      "We would like to send you a verification code, which will allow you to continue.",
    ),
    "continueWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Continue with Google",
    ),
    "email": MessageLookupByLibrary.simpleMessage("e-mail"),
    "homeTabLabel": MessageLookupByLibrary.simpleMessage("Home"),
    "landingPageTitle": MessageLookupByLibrary.simpleMessage(
      "Every Peak Becomes An Achievement",
    ),
    "landingTermsText": MessageLookupByLibrary.simpleMessage(
      "By continuing, you agree to the\n",
    ),
    "mapTabLabel": MessageLookupByLibrary.simpleMessage("Map"),
    "otpHeadline": MessageLookupByLibrary.simpleMessage("Check your inbox"),
    "otpResend": MessageLookupByLibrary.simpleMessage("Resend code"),
    "otpResendTimer": m0,
    "otpSubheadline": m1,
    "peaksTabLabel": MessageLookupByLibrary.simpleMessage("Peaks"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "profileTabLabel": MessageLookupByLibrary.simpleMessage("Profile"),
    "send": MessageLookupByLibrary.simpleMessage("Send"),
    "terms": MessageLookupByLibrary.simpleMessage("Terms"),
  };
}
