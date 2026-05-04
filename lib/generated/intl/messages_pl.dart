// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pl locale. All the
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
  String get localeName => 'pl';

  static String m0(seconds) => "Wyślij ponownie za ${seconds}s";

  static String m1(value) =>
      "Wysłaliśmy Ci kod 6-cyfrowy kod weryfikacyjny na podany adres ${value}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "and": MessageLookupByLibrary.simpleMessage(" i "),
    "appTitle": MessageLookupByLibrary.simpleMessage(
      "marmo - Twój dziennik zdobywcy",
    ),
    "continueLabel": MessageLookupByLibrary.simpleMessage("Kontynuuj"),
    "continueWithApple": MessageLookupByLibrary.simpleMessage(
      "Kontynuuj z Apple",
    ),
    "continueWithEmail": MessageLookupByLibrary.simpleMessage(
      "Kontynuuj z E-mail",
    ),
    "continueWithEmailHeadline": MessageLookupByLibrary.simpleMessage(
      "Podaj adres e-mail",
    ),
    "continueWithEmailSubheadline": MessageLookupByLibrary.simpleMessage(
      "Chcielibyśmy wysłać Ci kod, który pozwoli Ci kontynuować",
    ),
    "continueWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Kontynuuj z Google",
    ),
    "email": MessageLookupByLibrary.simpleMessage("e-mail"),
    "homeTabLabel": MessageLookupByLibrary.simpleMessage("Strona główna"),
    "landingPageTitle": MessageLookupByLibrary.simpleMessage(
      "Każdy szczyt staje się osiągnięciem",
    ),
    "landingTermsText": MessageLookupByLibrary.simpleMessage(
      "Kontynuując, akceptujesz\n",
    ),
    "mapTabLabel": MessageLookupByLibrary.simpleMessage("Mapa"),
    "otpHeadline": MessageLookupByLibrary.simpleMessage("Sprawdź pocztę"),
    "otpResend": MessageLookupByLibrary.simpleMessage("Wyślij ponownie"),
    "otpResendTimer": m0,
    "otpSubheadline": m1,
    "peaksTabLabel": MessageLookupByLibrary.simpleMessage("Szczyty"),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage(
      "Politykę prywatności",
    ),
    "profileTabLabel": MessageLookupByLibrary.simpleMessage("Profil"),
    "send": MessageLookupByLibrary.simpleMessage("Wyślij"),
    "terms": MessageLookupByLibrary.simpleMessage("Regulamin"),
  };
}
