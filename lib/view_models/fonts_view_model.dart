import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/models/fonts_model.dart';

final fontSettingsProvider = FutureProvider<FontSettings>((ref) async {
  try {
    final doc = await FirebaseFirestore.instance
        .collection('settings')
        // .doc('fontSettings')
        .doc('theme')
        .get();
    print('document data ==== ${doc.data()}');
    if (doc.exists && doc.data() != null) {
      print('data======');
      return FontSettings.fromMap(
          doc.data()!); // Assumes fromMap is implemented
    } else {
      throw Exception("Document does not exist or has no data");
    }
  } catch (e) {
    print('Error fetching font settings: $e');
    rethrow; // This will trigger the error state in your provider
  }
});