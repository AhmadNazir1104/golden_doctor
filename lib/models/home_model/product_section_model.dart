import 'package:golden_doctor/models/home_model/home_model.dart';

class ProductsCarouselSection implements BaseSection {
  final String type;
  final String title;
  final List<Product> body;

  ProductsCarouselSection({
    required this.type,
    required this.title,
    required this.body,
  });

  factory ProductsCarouselSection.fromJson(Map<String, dynamic> json) {
    return ProductsCarouselSection(
      type: json['type'],
      title: json['title'],
      body: List<Product>.from(
          json['body'].map((item) => Product.fromJson(item))),
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

class Product {
  final String objId;
  final String objName;
  final String objType;
  final String handle;

  Product({
    required this.objId,
    required this.objName,
    required this.objType,
    required this.handle,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      objId: json['obj_id'],
      objName: json['obj_name'],
      objType: json['obj_type'],
      handle: json['handle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'obj_id': objId,
      'obj_name': objName,
      'obj_type': objType,
      'handle': handle,
    };
  }
}
