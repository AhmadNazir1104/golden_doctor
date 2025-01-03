
class FontSettings {
  final String fontFamily;
  final int headline1Size;
  final int headline2Size;
  final int body1Size;
  final int body2Size;
  final int body3Size;
  final int headline1Weight;
  final int headline2Weight;
  final int body1Weight;
  final int body2Weight;
  final int body3Weight;
  String buttonBgColor;
  String buttonTextColor;

  FontSettings({
    required this.fontFamily,
    required this.headline1Size,
    required this.headline2Size,
    required this.body1Size,
    required this.body2Size,
    required this.body3Size,
    required this.headline1Weight,
    required this.headline2Weight,
    required this.body1Weight,
    required this.body2Weight,
    required this.body3Weight,
    required this.buttonBgColor,
    required this.buttonTextColor,
  });

  factory FontSettings.fromMap(Map<String, dynamic> map) {
    return FontSettings(
      fontFamily: map['font_family'] ?? 'Poppins',
      headline1Size: map['headline1_size'] ?? 24.0,
      headline2Size: map['headline2_size'] ?? 20.0,
      body1Size: map['body1_size'] ?? 16.0,
      body2Size: map['body2_size'] ?? 14.0,
      body3Size: map['body3_size'] ?? 12.0,
      headline1Weight: map['headline1_weight'] ?? 7,
      headline2Weight: map['headline2_weight'] ?? 5,
      body1Weight: map['body1_weight'] ?? 4,
      body2Weight: map['body2_weight'] ?? 4,
      body3Weight: map['body3_weight'] ?? 4,
      buttonBgColor: map['button_bg_color'] ?? '#ffffff',
      buttonTextColor: map['button_text_color'] ?? '#000000',

    );
  }
}
