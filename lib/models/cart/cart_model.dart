// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

// part 'cart_model.freezed.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel {
  @HiveField(0)
  String? productName;
  @HiveField(1)
  String? productID;
  @HiveField(2)
  String? productGraphID;
  @HiveField(3)
  String? productColor;
  @HiveField(4)
  String? productSize;
  @HiveField(5)
  String? varientID;
  @HiveField(6)
  String? productImage;
  @HiveField(7)
  String? productPrice;
  @HiveField(8)
  String? quantity;
  @HiveField(9)
  String? comparePrice;
  @HiveField(10)
  String? sku;
  @HiveField(11)
  bool? available;
  @HiveField(12)
  String? userId;
  @HiveField(13)
  String? vendor;
  CartModel({
    this.productName,
    this.productID,
    this.productGraphID,
    this.productColor,
    this.productSize,
    this.varientID,
    this.productImage,
    this.productPrice,
    this.quantity,
    this.comparePrice,
    this.sku,
    this.available,
    this.userId,
    this.vendor,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        productName: json["productName"],
        productID: json["productID"],
        productColor: json["productColor"],
        productSize: json['productSize'],
        varientID: json["varientID"],
        productImage: json['productImage'],
        productPrice: json['productPrice'],
        quantity: json['quantity'],
        comparePrice: json['comparePrice'],
        sku: json['sku'],
        available: json['availabe'],
        userId: json['userId'],
        vendor: json['vendor'],
      );
}
