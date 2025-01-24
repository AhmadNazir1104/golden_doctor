import 'dart:convert';
import 'package:collection/collection.dart';

CollectionProductsModel collectionProductsModelFromJson(String str) =>
    CollectionProductsModel.fromJson(json.decode(str));

String collectionProductsModelToJson(CollectionProductsModel data) =>
    json.encode(data.toJson());

class CollectionProductsModel {
  final Data data;

  CollectionProductsModel({
    required this.data,
  });

  factory CollectionProductsModel.fromJson(Map<String, dynamic> json) =>
      CollectionProductsModel(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  final Collection collection;

  Data({
    required this.collection,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        collection: Collection.fromJson(json["collection"]),
      );

  Map<String, dynamic> toJson() => {
        "collection": collection.toJson(),
      };
}

class Collection {
  final Products products;

  Collection({
    required this.products,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        products: Products.fromJson(json["products"]),
      );

  Map<String, dynamic> toJson() => {
        "products": products.toJson(),
      };
}

class Products {
  final PageInfo pageInfo;
  final List<ProductsEdge> edges;

  Products({
    required this.pageInfo,
    required this.edges,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        edges: json["edges"] != null
            ? List<ProductsEdge>.from(
                json["edges"].map((x) => ProductsEdge.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "pageInfo": pageInfo.toJson(),
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class ProductsEdge {
  final String? cursor;
  final PurpleNode node;

  ProductsEdge({
    required this.cursor,
    required this.node,
  });

  factory ProductsEdge.fromJson(Map<String, dynamic> json) => ProductsEdge(
        cursor: json["cursor"],
        node: PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "cursor": cursor,
        "node": node.toJson(),
      };
}

class PurpleNode {
  final String gid;
  final String? productQuantity;
  final String title;
  final List<String> tags;
  final String description;
  final String descriptionHtml;
  final String productType;
  final DateTime publishedAt;
  final String onlineStoreUrl;
  final Variants variants;
  final Images images;
  final String id;
  final List<Options> options;
  final String? fitMetafield;
  final String? descriptionMetafield;

  String? variantColor;

  PurpleNode({
    required this.gid,
    required this.productQuantity,
    required this.title,
    required this.tags,
    required this.description,
    required this.descriptionHtml,
    required this.productType,
    required this.publishedAt,
    required this.onlineStoreUrl,
    required this.variants,
    required this.images,
    required this.id,
    required this.options,
    this.fitMetafield,
    this.variantColor,
    this.descriptionMetafield,
  });

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        gid: json["gid"] ?? "N/A",
        productQuantity: json['quantityAvailable'] ?? "N/A",
        title: json["title"] ?? "N/A",
        tags: List<String>.from(json["tags"].map((x) => x)),
        description: json["description"] ?? "N/A",
        descriptionHtml: json["descriptionHtml"] ?? "N/A",
        productType: json["productType"] ?? "N/A",
        publishedAt: DateTime.parse(json["publishedAt"]),
        onlineStoreUrl: json["onlineStoreUrl"] ?? "N/A",
        variants: Variants.fromJson(json["variants"]),
        images: Images.fromJson(json["images"]),
        id: json["id"] ?? "N/A",
        options:
            List<Options>.from(json["options"].map((x) => Options.fromJson(x))),
        fitMetafield:
            getValueForKey(items: json["metafields"], key: "fit") ?? null,
        // json["metafields"].toString() == '[null]'
        //     ? ""
        //     : json["metafields"].firstWhere((x) {
        //       print(x["key"]);
        //       print(x["value"]);
        //         return x["key"] == "fit";
        //       })?["value"],
        //     print(json["metafields"].toString());
        //     print("-----");
        //     print(x["key"]);
        //     print(x["value"]);
        //     print("-----");
        //     if (x["key"] == "fit") {
        //       return x["value"];
        //     }
        //   },
        // ),
        // json["metafield"] != null ? json["metafield"]["value"] : null,
        descriptionMetafield: getValueForKey(
                items: json["metafields"], key: "product_description") ??
            null,
        // json["metafields"].toString() == '[null]'
        //     ? ""
        //     : json["metafields"].firstWhere((x) {
        //       print(x["key"]);
        //       print(x["value"]);
        //         return x["key"] == "product_description";
        //       })?["value"],
        // json["metafields"].map(
        //     (x) {
        //       print(json["metafields"].toString());
        //       print("-----");
        //       print(x["key"]);
        //       print(x["value"]);
        //       print("-----");
        //       if (x["key"] == "product_description") {
        //         return x["value"];
        //       }
        //     },
        //   ),
        // json["metafield"] != null ? json["metafield"]["value"] : null,
      );

  Map<String, dynamic> toJson() => {
        "gid": gid,
        "title": title,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "description": description,
        "descriptionHtml": descriptionHtml,
        "productType": productType,
        "publishedAt": publishedAt.toIso8601String(),
        "onlineStoreUrl": onlineStoreUrl,
        "variants": variants.toJson(),
        "images": images.toJson(),
        "id": id,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

String? getValueForKey({List<dynamic>? items, required String key}) {
  print("---");
  print(items.toString());
  if (items == null) return null; // Handle null response list
  final item = items.firstWhereOrNull((element) => element?['key'] == key);
  return item?['value']; // Use null-safe access
}

class Options {
  final String name;
  final List<String> values;

  Options({
    required this.name,
    required this.values,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        name: json["name"],
        values:
            // json["values"],
            List<String>.from(json["values"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "values": values, //List<dynamic>.from(values.map((x) => x)),
      };
}

class Images {
  final List<ImagesEdge> edges;

  Images({
    required this.edges,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        edges: List<ImagesEdge>.from(
            json["edges"].map((x) => ImagesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class ImagesEdge {
  final FluffyNode node;

  ImagesEdge({
    required this.node,
  });

  factory ImagesEdge.fromJson(Map<String, dynamic> json) => ImagesEdge(
        node: FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class FluffyNode {
  final String url;
  final String altText;

  FluffyNode({
    required this.url,
    required this.altText,
  });

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        url: json["url"] ?? "",
        altText: json["altText"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Variants {
  final List<VariantsEdge> edges;

  Variants({
    required this.edges,
  });

  factory Variants.fromJson(Map<String, dynamic> json) => Variants(
        edges: List<VariantsEdge>.from(
            json["edges"].map((x) => VariantsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class VariantsEdge {
  final TentacledNode node;

  VariantsEdge({
    required this.node,
  });

  factory VariantsEdge.fromJson(Map<String, dynamic> json) => VariantsEdge(
        node: TentacledNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node.toJson(),
      };
}

class TentacledNode {
  final String id;
  final String title;
  final ProductImage image;
  final Price price;
  final String sku;
  final Price compareAtPrice;
  final bool availableForSale;
  final List<SelectedOption> selectedOptions;

  TentacledNode({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.sku,
    required this.compareAtPrice,
    required this.availableForSale,
    required this.selectedOptions,
  });

  factory TentacledNode.fromJson(Map<String, dynamic> json) => TentacledNode(
        id: json["id"],
        title: json["title"] ?? "N/A",
        image: ProductImage.fromJson(json["image"]),
        price: Price.fromJson(json["price"]),
        sku: json["sku"] ?? "N/A",
        compareAtPrice: Price.fromJson(json["compareAtPrice"]),
        availableForSale: json["availableForSale"] ?? "N/A",
        selectedOptions: List<SelectedOption>.from(
            json["selectedOptions"].map((x) => SelectedOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image.toJson(),
        "price": price.toJson(),
        "sku": sku,
        "compareAtPrice": compareAtPrice.toJson(),
        "availableForSale": availableForSale,
        "selectedOptions":
            List<dynamic>.from(selectedOptions.map((x) => x.toJson())),
      };
}

class Price {
  final String amount;

  Price({
    required this.amount,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        amount: double.parse(json["amount"]).toInt().toString(),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
      };
}

class ProductImage {
  final String src;

  ProductImage({
    required this.src,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        src: json["src"] ?? json["url"],
      );

  Map<String, dynamic> toJson() => {
        "src": src,
      };
}

class SelectedOption {
  final String name;
  final String value;

  SelectedOption({
    required this.name,
    required this.value,
  });

  factory SelectedOption.fromJson(Map<String, dynamic> json) => SelectedOption(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class PageInfo {
  final bool hasNextPage;
  final bool hasPreviousPage;
  final String? startCursor;
  final String? endCursor;

  PageInfo({
    required this.hasNextPage,
    required this.hasPreviousPage,
    required this.startCursor,
    required this.endCursor,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        hasNextPage: json["hasNextPage"],
        hasPreviousPage: json["hasPreviousPage"],
        startCursor: json["startCursor"],
        endCursor: json["endCursor"],
      );

  Map<String, dynamic> toJson() => {
        "hasNextPage": hasNextPage,
        "hasPreviousPage": hasPreviousPage,
        "startCursor": startCursor,
        "endCursor": endCursor,
      };
}
