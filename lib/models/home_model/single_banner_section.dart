import 'package:golden_doctor/models/home_model/home_model.dart';

class SingleBannerSection  implements BaseSection {
  @override
  final String type;
  @override
  final String title;
  final List<SingleBanner> body;

  SingleBannerSection({
    required this.type,
    required this.title,
    required this.body,
  });

  factory SingleBannerSection.fromJson(Map<String, dynamic> json) {
    return SingleBannerSection(
      type: json['type'],
      title: json['title'],
      body: List<SingleBanner>.from(
          json['body'].map((item) => SingleBanner.fromJson(item))),
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

class SingleBanner {
  final String bannerAltText;
  final String objId;
  final String imgUrl;
  final String fileName;
  final String objName;
  final String objType;
  final String imgAlt;
  final String previewImage;
  final String height;

  SingleBanner({
    required this.bannerAltText,
    required this.objId,
    required this.imgUrl,
    required this.fileName,
    required this.objName,
    required this.objType,
    required this.imgAlt,
    required this.previewImage,
    required this.height,
  });

  factory SingleBanner.fromJson(Map<String, dynamic> json) {
    return SingleBanner(
      bannerAltText: json['banner_alt_text'],
      objId: json['obj_id'],
      imgUrl: json['img_url'] ?? '',
      fileName: json['file_name'],
      objName: json['obj_name'],
      objType: json['obj_type'],
      imgAlt: json['img_alt'] ?? '',
      previewImage: json['previewImage'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'banner_alt_text': bannerAltText,
      'obj_id': objId,
      'img_url': imgUrl,
      'file_name': fileName,
      'obj_name': objName,
      'obj_type': objType,
      'img_alt': imgAlt,
      'previewImage': previewImage,
      'height': height,
    };
  }
}
