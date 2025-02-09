import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:golden_doctor/graph_ql/query/mutation_query.dart';
import 'package:golden_doctor/models/authentication/profile_model.dart';
import 'package:golden_doctor/utils/handles.dart';

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
        '"merchandiseId"': '"${data.varientID}"',
        '"quantity"': data.quantity
      });
    }).toList();
    log('listOfMaps === ${listOfMaps.length}');

    ApiBaseHelper apiBaseHelper = ApiBaseHelper();
    String body = addToCartQuery(productListString: listOfMaps.toString());
    Map<String, dynamic> response =
        await apiBaseHelper.post(url: '', data: body);
    if (response['data']['cartCreate']['cart']['id'] == null) {
      print("Error cart can not created");
      Fluttertoast.showToast(msg: "Your Cart not created.");
      // addboleanValue(false);
    } else {
      checkout(context, response['data']['cartCreate']['cart']['id']);
    }
    addboleanValue(false);
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
