import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/graph_ql/config.dart';
import 'package:golden_doctor/graph_ql/query/mutation_query.dart';
import 'package:golden_doctor/models/authentication/profile_model.dart';
import 'package:golden_doctor/utils/handles.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/cart/cart_model.dart';

final checkoutObscureProvider = StateProvider<bool>((ref) => true);

class CheckoutApiClass extends ChangeNotifier {
  bool boleanValue = false;
  ProfileModel? profileModel;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');
  void addboleanValue(bool todo) {
    boleanValue = todo;
    notifyListeners();
  }

// ADD to Cart
  Future<void> addToCartShopify(
    BuildContext context,
    String email,
    List<CartModel> productList,
  ) async {
    addboleanValue(true);
    Future.delayed(Duration(seconds: 7)).then(
      (value) {
        if (boleanValue == true) {
          return addboleanValue(false);
        }
      },
    );

    var listOfMaps = [];

    productList.map((data) {
      listOfMaps.add({
        'merchandiseId': '"${data.varientID}"',
        'quantity': data.quantity,
        'attributes': [
                {
                    'key': '"your-key1"',
                    'value': '"your-value1"'
                },
                {
                    'key': '"your-key2"',
                    'value': '"your-value2"'
                }
            ],
      });
    }).toList();
    log('listOfMaps === ${listOfMaps.length}');

// ----------------------------------------------------------------------
// String p = jsonEncode(productList);
// String query = ;

// print("mmmmmmmmmmmmmmmmm");
// print(query);
    GraphQlHelper graphQlHelper = GraphQlHelper();
    QueryResult result = await graphQlHelper.client.value.query(
      QueryOptions(
        document: gql(newCartQuery(listOfMaps)),
      ),
    );
    if (result.hasException) {
      print("GraphQL has Exception");
      print(result.exception!.graphqlErrors);
    } else {
      print("GraphQL has no Exception");
      print(result.data);
      if (result.data!['cartCreate']['cart']['id'] == null) {
        print("Error cart can not created");
        Fluttertoast.showToast(msg: "Your Cart is not created.");
        // addboleanValue(false);
      } else {
        checkout(context, result.data!['cartCreate']['cart']['id']);
      }
      addboleanValue(false);
    }

// ----------------------------------------------------------------------
    // ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    // String body = addToCartQuery(productListString: listOfMaps.toString());
    // Map<String, dynamic> response =
    //     await apiBaseHelper.post(url: '', data: body);
    // if (response['data']['cartCreate']['cart']['id'] == null) {
    //   print("Error cart can not created");
    //   Fluttertoast.showToast(msg: "Your Cart not created.");
    //   // addboleanValue(false);
    // } else {
    //   checkout(context, response['data']['cartCreate']['cart']['id']);
    // }
    // addboleanValue(false);
  }

// Checkout
  Future<void> checkout(
    BuildContext context,
    String cartId,
  ) async {
    addboleanValue(true);
    Future.delayed(Duration(seconds: 7)).then(
      (value) {
        if (boleanValue == true) {
          return addboleanValue(false);
        }
      },
    );
    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    String body = checkOutQuery(cartId: cartId);
    Map<String, dynamic> response =
        await apiBaseHelper.post(url: '', data: body);
    if (response['data']['cart']['checkoutUrl'] == null) {
      print("----- Error Checkout URL is Empty");
      Fluttertoast.showToast(
        msg: "Try Again",
      );
      // addboleanValue(false);
    } else {
      context.push(
        "/checkout_webview_screen",
        extra: {
          "checkouturl": response['data']['cart']['checkoutUrl']
          // "checkouturl": beforeKey
        },
      );
      Fluttertoast.showToast(
        msg: " Checkout created Succefully ",
      );
    }
    addboleanValue(false);
  }
}

final checkoutApiServiceProvider =
    ChangeNotifierProvider<CheckoutApiClass>((ref) {
  return CheckoutApiClass();
});
