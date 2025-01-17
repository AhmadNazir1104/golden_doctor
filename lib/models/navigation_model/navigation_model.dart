// To parse this JSON data, do
//
//     final navigationModel = navigationModelFromJson(jsonString);

import 'dart:convert';

NavigationModel navigationModelFromJson(String str) =>
    NavigationModel.fromJson(json.decode(str));

String navigationModelToJson(NavigationModel data) =>
    json.encode(data.toJson());

class NavigationModel {
  final List<Navigation>? navigation;

  NavigationModel({
    this.navigation,
  });

  factory NavigationModel.fromJson(Map<String, dynamic> json) =>
      NavigationModel(
        navigation: json["navigation"] == null
            ? []
            : List<Navigation>.from(
                json["navigation"]!.map((x) => Navigation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "navigation": navigation == null
            ? []
            : List<dynamic>.from(navigation!.map((x) => x.toJson())),
      };
}

class Navigation {
  final dynamic objId;
  final List<Child>? children;
  final String? objName;
  final String? label;
  final String? type;

  Navigation({
    this.objId,
    this.children,
    this.objName,
    this.label,
    this.type,
  });

  factory Navigation.fromJson(Map<String, dynamic> json) => Navigation(
        objId: json["obj_id"],
        children: json["children"] == null
            ? []
            : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
        objName: json["obj_name"],
        label: json["label"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "obj_id": objId,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "obj_name": objName,
        "label": label,
        "type": type,
      };
}

class Child {
  final String? objId;
  final List<Child>? children;
  final String? objName;
  final String? label;
  final String? type;

  Child({
    this.objId,
    this.children,
    this.objName,
    this.label,
    this.type,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        objId: json["obj_id"],
        children: json["children"] == null
            ? []
            : List<Child>.from(json["children"]!.map((x) => Child.fromJson(x))),
        objName: json["obj_name"],
        label: json["label"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "obj_id": objId,
        "children": children == null
            ? []
            : List<dynamic>.from(children!.map((x) => x.toJson())),
        "obj_name": objName,
        "label": label,
        "type": type,
      };
}
