import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/graph_ql/config.dart';
import 'package:golden_doctor/graph_ql/query/mutation_query.dart';
import 'package:golden_doctor/models/product_quantity_model.dart/product_quantity_model.dart';
import 'package:golden_doctor/models/products/product_model.dart';
import 'package:golden_doctor/utils/handles.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:http/http.dart' as http;

final productDetailsProvider = NotifierProvider.autoDispose
    .family<ProductDetailViewModel, List<SelectedOption>, String>(() {
  return ProductDetailViewModel();
});

class ProductDetailViewModel
    extends AutoDisposeFamilyNotifier<List<SelectedOption>, String> {
  @override
  List<SelectedOption> build(String arg) => [];

  void selectOption(List<SelectedOption> newOption) {
    // print("New opetions");
    // print(jsonEncode(newOption));
    state = [...newOption];
  }

  ProductQuantityModel? productQuantityModel;
// This Function will return the Selected variant on Detals page
// Selected variant will be added to cart.
  VariantsEdge selectVariant({required ProductNode purpleNode}) {
    VariantsEdge variantsEdge = purpleNode.variants.edges[0];
    for (int i = 0; i < purpleNode.variants.edges.length; i++) {
      var a = purpleNode.variants.edges[i].node.selectedOptions
      .map((e) => e.toJson())
      .toList()
      .toString();
      var b = state.map((e) => e.toJson()).toList().toString();
      // print("Selected Options--------------");
      // print(jsonEncode(a));
      // print(jsonEncode(b));
      if (a == b) {
        variantsEdge = purpleNode.variants.edges[i];
        break;
      }
    }
    return variantsEdge;
  }

// This function will fetch product Quantity
  Future<void> productQuentity(
    BuildContext context,
    String productId,
  ) async {
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    String body = productQuantityQuery(productId: productId);
    var response = await apiBaseHelper.post(url: '', data: body);
    productQuantityModel =
        ProductQuantityModel.fromJson(response['data']['product']);
  }

  // fetch products by collection
  Future<List<ProductEdge>?> fetchProducts({var collectionId}) async {
    if (kDebugMode) {
      print("Fetch Function");
    }
    List<ProductEdge> allProducts;
    if (collectionId == null) {
      return null;
    }
    GraphQlHelper graphQlHelper = GraphQlHelper();
    QueryResult result = await graphQlHelper.client.value.query(
      QueryOptions(
        document:
            gql(fetchProductwithCollectionIdfn(collectionId, cursor: null)),
        variables: {
          'numProducts': 40,
          'cursor': null,
        },
      ),
    );
    if (result.hasException) {
      if (kDebugMode) {
        print("GraphQL has Exception");
        print(result.exception!.graphqlErrors);
      }
      return null;
    } else {
      if (kDebugMode) {
        print(result.data!["collection"]["products"]["edges"][0]["node"]
            ["metafields"]);
      }
      Data collectionProducts = Data.fromJson(result.data!);
      allProducts = collectionProducts.collection.products.edges;
      if (kDebugMode) {
        print("new pro ${allProducts.length}");
      }
      return allProducts;
      // addProducts(allProducts);
      // print("total pro ${productList.length}");
      // setIsLoading();
    }
  }
}
