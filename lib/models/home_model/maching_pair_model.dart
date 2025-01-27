import 'package:golden_doctor/models/home_model/home_model.dart';

class MatchingPairsSection implements BaseSection {
  final String type;
  final String title;
  final String desktopImg;
  final String height;
  final List<MatchingPair> body;

  MatchingPairsSection({
    required this.type,
    required this.title,
    required this.desktopImg,
    required this.height,
    required this.body,
  });

  factory MatchingPairsSection.fromJson(Map<String, dynamic> json) {
    return MatchingPairsSection(
      type: json['type'],
      title: json['title'],
      desktopImg: json['desktop_img'],
      height: json['height'],
      body: List<MatchingPair>.from(
          json['body'].map((item) => MatchingPair.fromJson(item))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'title': title,
      'desktop_img': desktopImg,
      'height': height,
      'body': body.map((item) => item.toJson()).toList(),
    };
  }
}

class MatchingPair {
  final String objId;
  final String objName;
  final String objType;

  MatchingPair({
    required this.objId,
    required this.objName,
    required this.objType,
  });

  factory MatchingPair.fromJson(Map<String, dynamic> json) {
    return MatchingPair(
      objId: json['obj_id'],
      objName: json['obj_name'],
      objType: json['obj_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'obj_id': objId,
      'obj_name': objName,
      'obj_type': objType,
    };
  }
}
