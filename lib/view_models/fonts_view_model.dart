import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/models/fonts_model.dart';
import 'package:golden_doctor/models/language/language_model.dart';
import 'package:golden_doctor/models/traqnslation_model/translation_model.dart';
import 'package:golden_doctor/utils/app_fonts.dart';

List<TranslationModel> homePageTranslations = [];
List<TranslationModel> filtersTranslations = [];
List<TranslationModel> navigationTranslations = [];
List<TranslationModel> staticPagesTranslations = [];
List<TranslationModel> otherTranslations = [];

//////////////////////////////////////////////////////////////////       Font Seeting  Provider    /////////////////////////////////////////////////////////////////
final fontSettingsProvider = FutureProvider<FontSettings>((ref) async {
  try {
    final doc = await FirebaseFirestore.instance
        .collection('settings')
        // .doc('fontSettings')
        .doc('theme')
        .get();
    if (kDebugMode) {
      print('document data ==== ${doc.data()}');
    }
    if (doc.exists && doc.data() != null) {
      print('data======');
      FontSettings vreb = FontSettings.fromMap(doc.data()!);
      AppTextStyles.updateFontStyles(
        family: vreb.fontFamily,
        // h1Size: double.parse(fontSettings.headline1Size.toString()),
        // h2Size: double.parse(fontSettings.headline2Size.toString()),
        // b1Size: double.parse(fontSettings.body1Size.toString()),
        // b2Size: double.parse(fontSettings.body2Size.toString()),
        // b3Size: double.parse(fontSettings.body3Size.toString()),
        // h1Weight: fontWeightFromInt(fontSettings.headline1Weight),
        // h2Weight: fontWeightFromInt(fontSettings.headline2Weight),
        // b1Weight: fontWeightFromInt(fontSettings.body1Weight),
        // b2Weight: fontWeightFromInt(fontSettings.body2Weight),
        // b3Weight: fontWeightFromInt(fontSettings.body3Weight),
      );

      if (kDebugMode) {
        print('data======');
      }
      return FontSettings.fromMap(
          doc.data()!); // Assumes fromMap is implemented
    } else {
      throw Exception("Document does not exist or has no data");
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching font settings: $e');
    }
    rethrow; // This will trigger the error state in your provider
  }
});

//////////////////////////////////////////////////////////////////       Language  Provider    /////////////////////////////////////////////////////////////////
final getLanguageProvider = FutureProvider<List<LanguageModel>>((ref) async {
  try {
    final doc = await FirebaseFirestore.instance
        .collection('languages')
        .doc('languages')
        .get();

    if (doc.exists && doc.data() != null) {
      final data = doc.data()!;
      final languages = (data['languages'] as List)
          .map((language) => LanguageModel.fromMap(language))
          .toList();
      return languages;
    } else {
      throw Exception("Document does not exist or has no data");
    }
  } catch (e) {
    if (kDebugMode) {
      print('Error fetching languages: $e');
    }
    rethrow;
  }
});

//////////////////////////////////////////////////////////////////       Translation  Provider    /////////////////////////////////////////////////////////////////
final getTranslationProvider = FutureProvider<void>((ref) async {
  try {
    final doc = await FirebaseFirestore.instance
        .collection('translations')
        .doc('translations')
        .get();

    print('document data ==== ${doc.data()}');
    if (doc.exists && doc.data() != null) {
      final data = doc.data()!;
      final translations = (data['translations'] as List)
          .map((translation) => TranslationModel.fromMap(translation))
          .toList();

      // Clear the lists to avoid duplicates
      homePageTranslations.clear();
      filtersTranslations.clear();
      navigationTranslations.clear();
      staticPagesTranslations.clear();
      otherTranslations.clear();

      // Populate lists based on type
      for (var translation in translations) {
        switch (translation.type) {
          case 'home-page':
            homePageTranslations.add(translation);
            break;
          case 'filters':
            filtersTranslations.add(translation);
            break;
          case 'navigation':
            navigationTranslations.add(translation);
            break;
          case 'static-page':
            staticPagesTranslations.add(translation);
            break;
          default:
            otherTranslations.add(translation);
            break;
        }
      }
    } else {
      throw Exception("Document does not exist or has no data");
    }
  } catch (e) {
    print('Error fetching languages: $e');
    rethrow;
  }
});
// final getLanguageProvider = FutureProvider((ref) async {
//   try {
//     final doc = await FirebaseFirestore.instance
//         .collection('languages')
//         // .doc('fontSettings')
//         .doc('languages')
//         .get();
//     print('document data ==== ${doc.data()}');
//     // if (doc.exists && doc.data() != null) {
//     //   print('data======');
//     //   return FontSettings.fromMap(
//     //       doc.data()!); // Assumes fromMap is implemented
//     // } else {
//     //   throw Exception("Document does not exist or has no data");
//     // }
//   } catch (e) {
//     print('Error fetching font settings: $e');
//     rethrow; // This will trigger the error state in your provider
//   }
// });
