import 'package:golden_doctor/models/home_model/home_model.dart';

class CategoriesCarouselSection implements BaseSection {
  final String type;
  final String title;
  final List<Category> body;

  CategoriesCarouselSection({
    required this.type,
    required this.title,
    required this.body,
  });

  factory CategoriesCarouselSection.fromJson(Map<String, dynamic> json) {
    return CategoriesCarouselSection(
      type: json['type'],
      title: json['title'],
      body: List<Category>.from(
          json['body'].map((item) => Category.fromJson(item))),
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

class Category {
  final String bannerAltText;
  final String objId;
  final String objName;
  final String objType;
  final String desktopImg;
  final String height;

  Category({
    required this.bannerAltText,
    required this.objId,
    required this.objName,
    required this.objType,
    required this.desktopImg,
    required this.height,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      bannerAltText: json['banner_alt_text'],
      objId: json['obj_id'],
      objName: json['obj_name'],
      objType: json['obj_type'],
      desktopImg: json['desktop_img'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banner_alt_text': bannerAltText,
      'obj_id': objId,
      'obj_name': objName,
      'obj_type': objType,
      'desktop_img': desktopImg,
      'height': height,
    };
  }
}
