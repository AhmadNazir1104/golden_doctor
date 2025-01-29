class ColorPalette {
  final String colorName;
  final String hexCode;

  ColorPalette({required this.colorName, required this.hexCode});

  factory ColorPalette.fromJson(Map<String, dynamic> json) {
    return ColorPalette(
      colorName: json['color_name'],
      // hexCode: json['hex_code'],
      hexCode: int.parse(json['hex_code'].replaceFirst('#', '0xff')).toString(),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'color_name': colorName,
      'hex_code': hexCode,
    };
  }
}
