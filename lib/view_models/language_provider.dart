import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/languages/arabic_language.dart';
import 'package:golden_doctor/languages/english_language.dart';
import 'package:golden_doctor/languages/hindi_language.dart';
import 'package:golden_doctor/languages/italian_language.dart';
import 'package:golden_doctor/languages/urdu_language.dart';


// Define the supported languages
enum Language { english, arabic, italian, hindi, urdu }

// Create a provider for managing the selected language
final languageProvider = StateProvider<Language>((ref) => Language.english);

// Function to get the localized text based on the selected language
Map<String, String> getLanguageText(Language language) {
  switch (language) {
    case Language.arabic:
      return arabic;
    case Language.italian:
      return italian;
    case Language.hindi:
      return hindi;
    case Language.urdu:
      return urdu;
    default:
      return english;
  }
}
