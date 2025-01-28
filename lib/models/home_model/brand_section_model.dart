import 'package:golden_doctor/models/home_model/home_model.dart';

class BrandSection implements BaseSection {
  @override
  final String type;
  @override
  final String title;
  final List<Brand> body;

  BrandSection({
    required this.type,
    required this.title,
    required this.body,
  });

  factory BrandSection.fromJson(Map<String, dynamic> json) {
    return BrandSection(
      type: json['type'],
      title: json['title'],
      body: List<Brand>.from(json['body'].map((item) => Brand.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'body': body.map((item) => item.toJson()).toList(),
    };
  }
}

class Brand {
  final String bannerAltText;
  final String objId;
  final String objName;
  final String objType;
  final String imageSrc;
  final int id;

  Brand({
    required this.bannerAltText,
    required this.objId,
    required this.objName,
    required this.objType,
    required this.imageSrc,
    required this.id,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      bannerAltText: json['banner_alt_text'],
      objId: json['obj_id'],
      objName: json['obj_name'],
      objType: json['obj_type'],
      imageSrc: json['image_src'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banner_alt_text': bannerAltText,
      'obj_id': objId,
      'obj_name': objName,
      'obj_type': objType,
      'image_src': imageSrc,
      'id': id,
    };
  }
}
