class TranslationModel {
  final String translatedContent;
  final String baseContent;
  final String locale;
  final String type;

  TranslationModel({
    required this.translatedContent,
    required this.baseContent,
    required this.locale,
    required this.type,
  });

  // Factory constructor to create a TranslationModel object from a map
  factory TranslationModel.fromMap(Map<String, dynamic> map) {
    return TranslationModel(
      translatedContent: map['translated_content'] ?? '',
      baseContent: map['base_content'] ?? '',
      locale: map['locale'] ?? '',
      type: map['type'] ?? '',
    );
  }

  // Convert a TranslationModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'translated_content': translatedContent,
      'base_content': baseContent,
      'locale': locale,
      'type': type,
    };
  }
}
