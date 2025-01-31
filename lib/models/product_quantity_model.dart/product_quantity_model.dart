// To parse this JSON data, do
//
//     final productQuantityModel = productQuantityModelFromJson(jsonString);

import 'dart:convert';

ProductQuantityModel productQuantityModelFromJson(String str) =>
    ProductQuantityModel.fromJson(json.decode(str));

String productQuantityModelToJson(ProductQuantityModel data) =>
    json.encode(data.toJson());

class ProductQuantityModel {
  final int? totalInventory;
  final Variants? variants;

  ProductQuantityModel({
    this.totalInventory,
    this.variants,
  });

  ProductQuantityModel copyWith({
    int? totalInventory,
    Variants? variants,
  }) =>
      ProductQuantityModel(
        totalInventory: totalInventory ?? this.totalInventory,
        variants: variants ?? this.variants,
      );

  factory ProductQuantityModel.fromJson(Map<String, dynamic> json) =>
      ProductQuantityModel(
        totalInventory: json["totalInventory"],
        variants: json["variants"] == null
            ? null
            : Variants.fromJson(json["variants"]),
      );

  Map<String, dynamic> toJson() => {
        "totalInventory": totalInventory,
        "variants": variants?.toJson(),
      };
}

class Variants {
  final List<Edge>? edges;

  Variants({
    this.edges,
  });

  Variants copyWith({
    List<Edge>? edges,
  }) =>
      Variants(
        edges: edges ?? this.edges,
      );

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
        edges: json["edges"] == null
            ? []
            : List<Edge>.from(json["edges"]!.map((x) => Edge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? []
            : List<dynamic>.from(edges!.map((x) => x.toJson())),
      };
}

class Edge {
  final Node? node;

  Edge({
    this.node,
  });

  Edge copyWith({
    Node? node,
  }) =>
      Edge(
        node: node ?? this.node,
      );

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
        node: json["node"] == null ? null : Node.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node?.toJson(),
      };
}

class Node {
  final int? quantityAvailable;
  final String? id;

  Node({
    this.quantityAvailable,
    this.id,
  });

  Node copyWith({
    int? quantityAvailable,
    String? id,
  }) =>
      Node(
        quantityAvailable: quantityAvailable ?? this.quantityAvailable,
        id: id ?? this.id,
      );

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        quantityAvailable: json["quantityAvailable"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "quantityAvailable": quantityAvailable,
        "id": id,
      };
}
