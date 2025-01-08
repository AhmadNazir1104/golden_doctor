class LanguageModel {
  final String fileName;
  final String iconSrc;
  final String label;
  final int id;
  final String title;

  LanguageModel({
    required this.fileName,
    required this.iconSrc,
    required this.label,
    required this.id,
    required this.title,
  });

  // Factory constructor to create a LanguageModel object from a map
  factory LanguageModel.fromMap(Map<String, dynamic> map) {
    return LanguageModel(
      fileName: map['file_name'] ?? '',
      iconSrc: map['icon_src'] ?? '',
      label: map['label'] ?? '',
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
    );
  }

  // Convert a LanguageModel object to a map
  Map<String, dynamic> toMap() {
    return {
      'file_name': fileName,
      'icon_src': iconSrc,
      'label': label,
      'id': id,
      'title': title,
    };
  }
}
