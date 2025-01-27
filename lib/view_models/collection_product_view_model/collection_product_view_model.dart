import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/graph_ql/config.dart';
import 'package:golden_doctor/graph_ql/query/mutation_query.dart';
import 'package:golden_doctor/models/products/product_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductNotifier extends ChangeNotifier {
  List<ProductsEdge> productList = [];
  Data? collectionProducts;

  bool isLoading = false;
  setIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void addProducts(List<ProductsEdge> newProducts) {
    // productList = [];
    productList = [...productList, ...newProducts];
  }

  void getData({var collectionId, required String type}) async {
    print("Fetch Function");
    print("Old pro ${productList.length}");
    if (type == "Initial Fetch" && productList.isNotEmpty) {
      log('in the Initial Fetch');
      return;
    } else if (type == "Fetch More") {
      log('in the Fetch More');
      if (collectionProducts!.collection.products.pageInfo.hasNextPage) {
        // setIsLoading();
        GraphQlHelper graphQlHelper = new GraphQlHelper();
        QueryResult result = await graphQlHelper.client.value.query(
          QueryOptions(
            document: gql(fetchProductwithCollectionIdfn(collectionId,
                cursor: collectionProducts!
                    .collection.products.pageInfo.endCursor)),
            variables: {
              'numProducts': 25,
              'cursor':
                  collectionProducts!.collection.products.pageInfo.endCursor
            },
          ),
        );
        if (result.hasException) {
          log('GraphQL has Exception');
          // setIsLoading();
          print("GraphQL has Exception");
          print(result.exception!.graphqlErrors);
        } else {
          log('new pro');
          log('New Products ======== ${result.data!}');
          collectionProducts = Data.fromJson(result.data!);

          List<ProductsEdge> allProducts = await makeVariantsAsProducts(
              collectionProducts!.collection.products.edges);
          print("new pro ${allProducts.length}");
          addProducts(allProducts);
          print("total pro ${productList.length}");
          // Future.delayed(Duration(seconds: 5), ()=>setIsLoading());
          // setIsLoading();
          notifyListeners();
        }
      }
    } else {
             log('GraphQL has Exception else -----');
      setIsLoading();
      GraphQlHelper graphQlHelper = new GraphQlHelper();
      QueryResult result = await graphQlHelper.client.value.query(
        QueryOptions(
          document:
              gql(fetchProductwithCollectionIdfn(collectionId, cursor: null)),
          variables: {
            'numProducts': 25,
            'cursor': null,
          },
        ),
      );
      if (result.hasException) {
               log('result.hasException');
        setIsLoading();
        print("GraphQL has Exception");
        print(result.exception!.graphqlErrors);
      } else {
        print(result.data!["collection"]["products"]["edges"][0]["node"]
            ["metafields"]);
        collectionProducts = Data.fromJson(result.data!);
        List<ProductsEdge> allProducts = await makeVariantsAsProducts(
            collectionProducts!.collection.products.edges);
        print("new pro ${allProducts.length}");
        addProducts(allProducts);
        print("total pro ${productList.length}");
        setIsLoading();
      }
    }
  }
}

final collectionsProductsProvider =
    ChangeNotifierProvider.autoDispose<ProductNotifier>(
        (ref) => ProductNotifier());

// List<ProductsEdge> makeVariantsAsProducts(List<ProductsEdge> productsEdges) {

//   List<ProductsEdge> allProducts = [];
//   productsEdges.map((product) {
//     ProductsEdge tempProduct = product;
//     // new ProductsEdge.fromJson(
//     //   jsonDecode(jsonEncode(product)),
//     // );
//     if (tempProduct.node.options[0].values.length > 1) {
//       for (int i = 0; i < tempProduct.node.options[0].values.length; i++) {
//         tempProduct.node.variantColor = tempProduct.node.options[0].values[i];
//         print(tempProduct.node.variantColor);
//         PurpleNode purpleNode = new PurpleNode(
//           gid: product.node.gid,
//           productQuantity: product.node.productQuantity,
//           title: product.node.title,
//           tags: product.node.tags,
//           description: product.node.description,
//           descriptionHtml: product.node.descriptionHtml,
//           productType: product.node.productType,
//           publishedAt: product.node.publishedAt,
//           onlineStoreUrl: product.node.onlineStoreUrl,
//           variants: product.node.variants,
//           images: product.node.images,
//           id: product.node.id,
//           options: product.node.options,
//           fitMetafield: product.node.fitMetafield,
//           variantColor: product.node.options[0].values[i],
//         );
//         String? cursor = product.cursor;
//         ProductsEdge tempProduct1 =
//             new ProductsEdge(cursor: cursor, node: purpleNode);
//         allProducts.add(tempProduct1);
//         // for (VariantsEdge variant in tempProduct.node.variants.edges) {
//         //   if (true) {}
//         // }
//       }
//     } else {
//       tempProduct.node.variantColor = tempProduct.node.options[0].values[0];
//       allProducts.add(tempProduct);
//     }
//   }).toList();
//   return allProducts;
// }

/// The original function adapted for `compute`
Future<List<ProductsEdge>> makeVariantsAsProducts(
    List<ProductsEdge> productsEdges) async {
  // Use `compute` to run the computation in a separate isolate
  return await compute(_makeVariantsAsProductsIsolate, productsEdges);
}

/// The isolate function
List<ProductsEdge> _makeVariantsAsProductsIsolate(
    List<ProductsEdge> productsEdges) {
  List<ProductsEdge> allProducts = [];
  for (var product in productsEdges) {
    var tempProduct = product;
    if (tempProduct.node.options[0].values.length > 1) {
      for (var value in tempProduct.node.options[0].values) {
        // check if image is available for particular color variant and its quantity is available.
        if (tempProduct.node.images.edges.any((e) => e.node.altText == value) &&
            tempProduct.node.variants.edges.any((e) =>
                e.node.availableForSale == true &&
                e.node.selectedOptions[0].value == value)) {
          tempProduct.node.variantColor = value;
          PurpleNode purpleNode = PurpleNode(
            gid: product.node.gid,
            productQuantity: product.node.productQuantity,
            title: product.node.title,
            tags: product.node.tags,
            description: product.node.description,
            descriptionHtml: product.node.descriptionHtml,
            productType: product.node.productType,
            publishedAt: product.node.publishedAt,
            onlineStoreUrl: product.node.onlineStoreUrl,
            variants: product.node.variants,
            images: product.node.images,
            id: product.node.id,
            options: product.node.options,
            fitMetafield: product.node.fitMetafield,
            variantColor: value,
          );
          allProducts.add(
            ProductsEdge(cursor: product.cursor, node: purpleNode),
          );
        }
      }
    } else {
      if (tempProduct.node.variants.edges
          .any((e) => e.node.availableForSale == true)) {
        tempProduct.node.variantColor = tempProduct.node.options[0].values[0];
        allProducts.add(tempProduct);
      }
    }
  }
  return allProducts;
}

// FetchMoreOptions fetchMoreMethod(String? _endCursor) {
//   return FetchMoreOptions(
//     variables: {'numProducts': 20, 'cursor': _endCursor},
//     updateQuery: (previousResultData, fetchMoreResultData) async {
//       // Offload the merging of edges to a new isolate
//       return await compute(
//         _mergeEdgesInIsolate,
//         {
//           'previousResultData': previousResultData,
//           'fetchMoreResultData': fetchMoreResultData,
//         },
//       );
//     },
//   );
// }

// /// Function that runs in the isolate
// Map<String, dynamic> _mergeEdgesInIsolate(Map<String, dynamic> data) {
//   final Map<String, dynamic>? previousResultData = data['previousResultData'];
//   final Map<String, dynamic>? fetchMoreResultData = data['fetchMoreResultData'];

//   final List<dynamic> previousEdges =
//       previousResultData!['collection']['products']['edges'];
//   final List<dynamic> newEdges =
//       fetchMoreResultData!['collection']['products']['edges'];

//   // Merge edges
//   fetchMoreResultData['collection']['products']['edges'] = [
//     ...previousEdges,
//     ...newEdges,
//   ];

//   return fetchMoreResultData;
// }
