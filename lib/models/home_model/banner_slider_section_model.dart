import 'package:golden_doctor/models/home_model/home_model.dart';

class BannerSliderSection  implements BaseSection  {
  final String type;
  final String title;
  final List<Banner> body;

  BannerSliderSection({
    required this.type,
    required this.title,
    required this.body,
  });

  factory BannerSliderSection.fromJson(Map<String, dynamic> json) {
    return BannerSliderSection(
      type: json['type'],
      title: json['title'],
      body:
          List<Banner>.from(json['body'].map((item) => Banner.fromJson(item))),
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

class Banner {
  final String bannerAltText;
  final String objId;
  final String objName;
  final String fileName;
  final String objType;
  final String desktopImg;

  Banner({
    required this.bannerAltText,
    required this.objId,
    required this.objName,
    required this.fileName,
    required this.objType,
    required this.desktopImg,
  });

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      bannerAltText: json['banner_alt_text'],
      objId: json['obj_id'],
      objName: json['obj_name'],
      fileName: json['file_name'],
      objType: json['obj_type'],
      desktopImg: json['desktop_img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banner_alt_text': bannerAltText,
      'obj_id': objId,
      'obj_name': objName,
      'file_name': fileName,
      'obj_type': objType,
      'desktop_img': desktopImg,
    };
  }
}
