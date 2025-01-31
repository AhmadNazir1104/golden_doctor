import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/graph_ql/config.dart';
import 'package:golden_doctor/graph_ql/query/mutation_query.dart';
import 'package:golden_doctor/models/products/product_model.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ProductNotifier extends ChangeNotifier {
  List<ProductEdge> productList = [];
  Data? collectionProducts;

  bool isLoading = false;
  setIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  void addProducts(List<ProductEdge> newProducts) {
    // productList = [];
    productList = [...productList, ...newProducts];
  }

  void getData({var collectionId, required String type}) async {
    print("Fetch Function");
    print("Old pro ${productList.length}");
    if (type == "Initial Fetch" && productList.isNotEmpty) {
      return;
    } else if (type == "Fetch More") {
      if (collectionProducts!.collection.products.pageInfo.hasNextPage) {
        // setIsLoading();
        GraphQlHelper graphQlHelper = GraphQlHelper();
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
          // setIsLoading();
          print("GraphQL has Exception");
          print(result.exception!.graphqlErrors);
        } else {
          collectionProducts = Data.fromJson(result.data!);
          List<ProductEdge> allProducts = await makeVariantsAsProducts(
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
      setIsLoading();
      GraphQlHelper graphQlHelper = GraphQlHelper();
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
        setIsLoading();
        print("GraphQL has Exception");
        print(result.exception!.graphqlErrors);
      } else {
        print(result.data!["collection"]["products"]["edges"][0]["node"]
            ["metafields"]);
        collectionProducts = Data.fromJson(result.data!);
        List<ProductEdge> allProducts = await makeVariantsAsProducts(
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
Future<List<ProductEdge>> makeVariantsAsProducts(
    List<ProductEdge> productsEdges) async {
  // Use `compute` to run the computation in a separate isolate
  return await compute(_makeVariantsAsProductsIsolate, productsEdges);
}

/// The isolate function
List<ProductEdge> _makeVariantsAsProductsIsolate(
    List<ProductEdge> productsEdges) {
  List<ProductEdge> allProducts = [];
  for (var product in productsEdges) {
    var tempProduct = product;
    if (tempProduct.node.options[0].optionValues.length > 1) {
      for (var value in tempProduct.node.options[0].optionValues) {
        // check if image is available for particular color variant and its quantity is available.
        if (tempProduct.node.images.edges.any((e) => e.node.altText == value.name) &&
            tempProduct.node.variants.edges.any((e) =>
                e.node.availableForSale == true &&
                e.node.selectedOptions[0].value == value.name)) {
          tempProduct.node.variantColor = value.name;
          ProductNode purpleNode = ProductNode(
            gid: product.node.gid,
            productQuantity: product.node.productQuantity,
            title: product.node.title,
            vendor: product.node.vendor,
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
            emborideryMetafield:product.node.emborideryMetafield,
            productRecomandationMetafield:product.node.productRecomandationMetafield,
            youMayAlsoLikeMetafield:product.node.youMayAlsoLikeMetafield,
            variantColor: value.name,
          );
          allProducts.add(
            ProductEdge(cursor: product.cursor, node: purpleNode),
          );
        }
      }
    } else {
      if (tempProduct.node.variants.edges
          .any((e) => e.node.availableForSale == true)) {
        tempProduct.node.variantColor = tempProduct.node.options[0].name  ;
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
