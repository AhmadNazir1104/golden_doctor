// // class SectionsModel {
// //   final List<Section> sections;

// //   SectionsModel({required this.sections});

// //   factory SectionsModel.fromJson(Map<String, dynamic> json) {
// //     return SectionsModel(
// //       sections: (json['sections'] as List<dynamic>)
// //           .map((section) => Section.fromJson(section))
// //           .toList(),
// //     );
// //   }
// // }

// // class Section {
// //   final String type;
// //   final String? title;
// //   final String? fileName;
// //   final String? desktopImg;
// //   final List<BodyItem>? body;
// //   final BannerItem? thirdBanner;
// //   final BannerItem? fourthBanner;

// //   Section({
// //     required this.type,
// //     this.title,
// //     this.fileName,
// //     this.desktopImg,
// //     this.body,
// //     this.thirdBanner,
// //     this.fourthBanner,
// //   });

// //   factory Section.fromJson(Map<String, dynamic> json) {
// //     return Section(
// //       type: json['type'] as String,
// //       title: json['title'] as String?,
// //       fileName: json['file_name'] as String?,
// //       desktopImg: json['desktop_img'] as String?,
// //       body: json['body'] != null
// //           ? (json['body'] as List<dynamic>)
// //               .map((item) => BodyItem.fromJson(item))
// //               .toList()
// //           : null,
// //       thirdBanner: json['third_banner'] != null
// //           ? BannerItem.fromJson(json['third_banner'])
// //           : null,
// //       fourthBanner: json['fourth_banner'] != null
// //           ? BannerItem.fromJson(json['fourth_banner'])
// //           : null,
// //     );
// //   }
// // }

// // class BodyItem {
// //   final String bannerAltText;
// //   final String objId;
// //   final String? objName;
// //   final String? objType;
// //   final String? fileName;
// //   final String? desktopImg;
// //   final String? handle;
// //   final String? imgUrl;
// //   final String? imgAlt;
// //   final String? previewImage;

// //   BodyItem({
// //     required this.bannerAltText,
// //     required this.objId,
// //     this.objName,
// //     this.objType,
// //     this.fileName,
// //     this.desktopImg,
// //     this.handle,
// //     this.imgUrl,
// //     this.imgAlt,
// //     this.previewImage,
// //   });

// //   factory BodyItem.fromJson(Map<String, dynamic> json) {
// //     return BodyItem(
// //       bannerAltText: json['banner_alt_text'] as String,
// //       objId: json['obj_id'] as String,
// //       objName: json['obj_name'] as String?,
// //       objType: json['obj_type'] as String?,
// //       fileName: json['file_name'] as String?,
// //       desktopImg: json['desktop_img'] as String?,
// //       handle: json['handle'] as String?,
// //       imgUrl: json['img_url'] as String?,
// //       imgAlt: json['img_alt'] as String?,
// //       previewImage: json['previewImage'] as String?,
// //     );
// //   }
// // }

// // class BannerItem {
// //   final String bannerAltText;
// //   final String objId;
// //   final String? objName;
// //   final String? objType;
// //   final String? fileName;
// //   final String? desktopImg;

// //   BannerItem({
// //     required this.bannerAltText,
// //     required this.objId,
// //     this.objName,
// //     this.objType,
// //     this.fileName,
// //     this.desktopImg,
// //   });

// //   factory BannerItem.fromJson(Map<String, dynamic> json) {
// //     return BannerItem(
// //       bannerAltText: json['banner_alt_text'] as String,
// //       objId: json['obj_id'] as String,
// //       objName: json['obj_name'] as String?,
// //       objType: json['obj_type'] as String?,
// //       fileName: json['file_name'] as String?,
// //       desktopImg: json['desktop_img'] as String?,
// //     );
// //   }
// // }

// // To parse this JSON data, do
// //
// //     final homeModel = homeModelFromJson(jsonString);

// import 'dart:convert';

// HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

// String homeModelToJson(HomeModel data) => json.encode(data.toJson());

// class HomeModel {
//   final List<Section>? sections;

//   HomeModel({
//     this.sections,
//   });

//   factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
//         sections: json["sections"] == null
//             ? []
//             : List<Section>.from(
//                 json["sections"]!.map((x) => Section.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "sections": sections == null
//             ? []
//             : List<dynamic>.from(sections!.map((x) => x.toJson())),
//       };
// }

// class Section {
//   final String? title;
//   final String? type;
//   final List<Body>? body;
//   final String? fileName;
//   final String? desktopImg;
//   final String? height;
//   final String? objId;
//   final String? toggleType;
//   final String? objName;
//   final String? objType;

//   Section({
//     this.title,
//     this.type,
//     this.body,
//     this.fileName,
//     this.desktopImg,
//     this.height,
//     this.objId,
//     this.toggleType,
//     this.objName,
//     this.objType,
//   });

//   factory Section.fromJson(Map<String, dynamic> json) => Section(
//         title: json["title"] ?? '',
//         type: json["type"] ?? '',
//         body: json["body"] == null
//             ? []
//             : List<Body>.from(json["body"]!.map((x) => Body.fromJson(x))),
//         fileName: json["file_name"] ?? '',
//         desktopImg: json["desktop_img"] ?? '',
//         height: json["height"] ?? '',
//         objId: json["obj_id"].toString(),
//         toggleType: json["Toggle_type"] ?? '',
//         objName: json["obj_name"] ?? '',
//         objType: json["obj_type"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "type": type,
//         "body": body == null
//             ? []
//             : List<dynamic>.from(body!.map((x) => x.toJson())),
//         "file_name": fileName,
//         "desktop_img": desktopImg,
//         "height": height,
//         "obj_id": objId,
//         "Toggle_type": toggleType,
//         "obj_name": objName,
//         "obj_type": objType,
//       };
// }

// class Body {
//   final String? bannerAltText;
//   final String? objId;
//   final String? fileName;
//   final String? objName;
//   final ObjType? objType;
//   final String? desktopImg;
//   final String? imgUrl;
//   final String? imgAlt;
//   final String? previewImage;
//   final String? height;
//   final String? handle;

//   Body({
//     this.bannerAltText,
//     this.objId,
//     this.fileName,
//     this.objName,
//     this.objType,
//     this.desktopImg,
//     this.imgUrl,
//     this.imgAlt,
//     this.previewImage,
//     this.height,
//     this.handle,
//   });

//   factory Body.fromJson(Map<String, dynamic> json) => Body(
//         bannerAltText: json["banner_alt_text"] ?? '',
//         objId: json["obj_id"].toString(),
//         fileName: json["file_name"] ?? '',
//         objName: json["obj_name"] ?? '',
//         objType: objTypeValues.map[json["obj_type"]]!,
//         desktopImg: json["desktop_img"] ?? '',
//         imgUrl: json["img_url"] ?? '',
//         imgAlt: json["img_alt"] ?? '',
//         previewImage: json["previewImage"] ?? '',
//         height: json["height"] ?? '',
//         handle: json["handle"] ?? '',
//       );

//   Map<String, dynamic> toJson() => {
//         "banner_alt_text": bannerAltText,
//         "obj_id": objId,
//         "file_name": fileName,
//         "obj_name": objName,
//         "obj_type": objTypeValues.reverse[objType],
//         "desktop_img": desktopImg,
//         "img_url": imgUrl,
//         "img_alt": imgAlt,
//         "previewImage": previewImage,
//         "height": height,
//         "handle": handle,
//       };
// }

// enum ObjType { collections, products, staticPage }

// final objTypeValues = EnumValues({
//   "collections": ObjType.collections,
//   "product": ObjType.products,
//   "static-page": ObjType.staticPage
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }



// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

// import 'dart:convert';

// HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

// String homeModelToJson(HomeModel data) => json.encode(data.toJson());

// class HomeModel {
//   final List<Section>? sections;

//   HomeModel({
//     this.sections,
//   });

//   factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
//         sections: json["sections"] == null
//             ? []
//             : List<Section>.from(
//                 json["sections"].map((x) => Section.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "sections": sections == null
//             ? []
//             : List<dynamic>.from(sections!.map((x) => x.toJson())),
//       };
// }

// class Section {
//   final String? fileName;
//   final List<Body>? body;
//   final String? type;
//   final String? title;
//   final String? desktopImg;
//   final String? height;
//   final String? objId;
//   final Type? toggleType;
//   final String? objName;
//   final String? objType;

//   Section({
//     this.fileName,
//     this.body,
//     this.type,
//     this.title,
//     this.desktopImg,
//     this.height,
//     this.objId,
//     this.toggleType,
//     this.objName,
//     this.objType,
//   });

//   factory Section.fromJson(Map<String, dynamic> json) => Section(
//         fileName: json["file_name"],
//         body: json["body"] == null
//             ? []
//             : List<Body>.from(json["body"]!.map((x) => Body.fromJson(x))),
//         type: json["type"],
//         title: json["title"],
//         desktopImg: json["desktop_img"],
//         height: json["height"],
//         objId: json["obj_id"],
//         toggleType: typeValues.map[json["Toggle_type"]]!,
//         objName: json["obj_name"],
//         objType: json["obj_type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "file_name": fileName,
//         "body": body == null
//             ? []
//             : List<dynamic>.from(body!.map((x) => x.toJson())),
//         "type": type,
//         "title": title,
//         "desktop_img": desktopImg,
//         "height": height,
//         "obj_id": objId,
//         "Toggle_type": typeValues.reverse[toggleType],
//         "obj_name": objName,
//         "obj_type": objType,
//       };
// }

// class Body {
//   final String? objId;
//   final String? objName;
//   final Type? objType;
//   final String? bannerAltText;
//   final String? fileName;
//   final String? desktopImg;
//   final int? id;
//   final String? imageSrc;
//   final String? handle;
//   final String? height;
//   final String? imgUrl;
//   final String? imgAlt;
//   final String? previewImage;

//   Body({
//     this.objId,
//     this.objName,
//     this.objType,
//     this.bannerAltText,
//     this.fileName,
//     this.desktopImg,
//     this.id,
//     this.imageSrc,
//     this.handle,
//     this.height,
//     this.imgUrl,
//     this.imgAlt,
//     this.previewImage,
//   });

//   factory Body.fromJson(Map<String, dynamic> json) => Body(
//         objId: json["obj_id"],
//         objName: json["obj_name"],
//         objType: typeValues.map[json["obj_type"]]!,
//         bannerAltText: json["banner_alt_text"],
//         fileName: json["file_name"],
//         desktopImg: json["desktop_img"],
//         id: json["id"],
//         imageSrc: json["image_src"],
//         handle: json["handle"],
//         height: json["height"],
//         imgUrl: json["img_url"],
//         imgAlt: json["img_alt"],
//         previewImage: json["previewImage"],
//       );

//   Map<String, dynamic> toJson() => {
//         "obj_id": objId,
//         "obj_name": objName,
//         "obj_type": typeValues.reverse[objType],
//         "banner_alt_text": bannerAltText,
//         "file_name": fileName,
//         "desktop_img": desktopImg,
//         "id": id,
//         "image_src": imageSrc,
//         "handle": handle,
//         "height": height,
//         "img_url": imgUrl,
//         "img_alt": imgAlt,
//         "previewImage": previewImage,
//       };
// }

// enum Type { BRANDS, COLLECTIONS, PRODUCT }

// final typeValues = EnumValues({
//   "brands": Type.BRANDS,
//   "collections": Type.COLLECTIONS,
//   "product": Type.PRODUCT
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }




import 'package:golden_doctor/models/home_model/banner_slider_section_model.dart';
import 'package:golden_doctor/models/home_model/brand_section_model.dart';
import 'package:golden_doctor/models/home_model/category_section_model.dart';
import 'package:golden_doctor/models/home_model/maching_pair_model.dart';
import 'package:golden_doctor/models/home_model/product_section_model.dart';
import 'package:golden_doctor/models/home_model/single_banner_section.dart';

class MainResponse {
  final List<dynamic> sections;

  MainResponse({
    required this.sections,
  });

  factory MainResponse.fromJson(Map<String, dynamic> json) {
    return MainResponse(
      sections: List<dynamic>.from(
        json['sections'].map((section) {
          if (section['type'] == 'matching_pairs') {
            return MatchingPairsSection.fromJson(section);
          } else if (section['type'] == 'banner_slider') {
            return BannerSliderSection.fromJson(section);
          } else if (section['type'] == 'brand_section') {
            return BrandSection.fromJson(section);
          } else if (section['type'] == 'products_carousel') {
            return ProductsCarouselSection.fromJson(section);
          } else if (section['type'] == 'categories_carousel') {
            return CategoriesCarouselSection.fromJson(section);
          } else if (section['type'] == 'single_banner') {
            return SingleBannerSection.fromJson(section);
          }
          // Handle any other section types or add a fallback
          return section;
        }),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sections': sections.map((section) {
        if (section is MatchingPairsSection) {
          return section.toJson();
        } else if (section is BannerSliderSection) {
          return section.toJson();
        } else if (section is BrandSection) {
          return section.toJson();
        } else if (section is ProductsCarouselSection) {
          return section.toJson();
        } else if (section is CategoriesCarouselSection) {
          return section.toJson();
        } else if (section is SingleBannerSection) {
          return section.toJson();
        }
        // Add fallback for any other sections
        return section;
      }).toList(),
    };
  }
}



abstract class BaseSection {
  String get type;
  String get title;
}
