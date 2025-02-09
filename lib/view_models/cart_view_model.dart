import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:golden_doctor/models/cart/cart_model.dart';
import 'package:golden_doctor/resources/services/hive.dart';
import 'package:hive/hive.dart';

final cartProvider =
    NotifierProvider<CartViewModel, List<CartModel>>(() => CartViewModel());

class CartViewModel extends Notifier<List<CartModel>> {
  @override
  List<CartModel> build() {
    return [];
  }

  int totalItemCount = 0;
  double totalItemPrice = 0.0;
  int getTotalItemCount() {
    return totalItemCount;
  }

  double calculateCartPrice() {
    double total = 0.0;
    state.map((e) {
      double itemPrice =
          double.parse(e.productPrice!) * double.parse(e.quantity!);
      total = total + itemPrice;
    }).toList();
    return total;
  }

  void getCart() async {
    try {
      // fetch from hive
      Box<CartModel> box = await Hive.openBox<CartModel>(HiveService.localCart);
      List<CartModel>? data = box.values.toList();
      if (kDebugMode) {
        print("data-----------: $data");
      }
      // add in provider state
      if (data.isNotEmpty) {
        data.map((e) {
          // add valuse in provider variables
          totalItemCount = totalItemCount + int.parse(e.quantity!);
          totalItemPrice = totalItemPrice +
              (double.parse(e.productPrice!)) * int.parse(e.quantity!);
        }).toList();
        state = data;
      }
    } catch (error) {
      if (kDebugMode) {
        print("Error-log :$error");
      }
    }
  }

  void addCart(CartModel cartData) async {
    try {
      // add new data in hive
      Box<CartModel> box = await Hive.openBox<CartModel>(HiveService.localCart);
      box.add(cartData);

      if (kDebugMode) {
        print("added Successfully");
      }
      // add valuse in provider variables
      totalItemCount = totalItemCount + int.parse(cartData.quantity!);
      totalItemPrice = totalItemPrice +
          (double.parse(cartData.productPrice!)) *
              int.parse(cartData.quantity!);
      // add in provider state
      state = [...state, cartData];
    } catch (error) {
      if (kDebugMode) {
        print("Error-log :$error");
      }
    }
  }

  void updateCart(CartModel cartData, int index) async {
    try {
      // update in hive
      Box<CartModel> box = await Hive.openBox<CartModel>(HiveService.localCart);
      box.put(index, cartData);
      List<CartModel> tempCartList = state;
      // Subtract previous value
      totalItemPrice = totalItemPrice -
          (double.parse(state[index].productPrice!)) *
              int.parse(state[index].quantity!);
      totalItemCount = totalItemCount - int.parse(state[index].quantity!);
      // Add New Value
      totalItemPrice = totalItemPrice +
          (double.parse(cartData.productPrice!)) *
              int.parse(cartData.quantity!);
      totalItemCount = totalItemCount + int.parse(cartData.quantity!);
      // update in porvider state
      tempCartList[index] = cartData;
      if (kDebugMode) {
        print("Wishlist Updated Successfully");
      }
      state = [...state];
    } catch (error) {
      if (kDebugMode) {
        print("Error-log :$error");
      }
    }
  }

  void deleteCart(int index) async {
    try {
      // remove from hive
      Box<CartModel> box = await Hive.openBox<CartModel>(HiveService.localCart);
      box.deleteAt(index);
      List<CartModel> tempCartList = state;
      // Subtract previous value
      totalItemPrice = totalItemPrice -
          (double.parse(state[index].productPrice!)) *
              int.parse(state[index].quantity!);
      totalItemCount = totalItemCount - int.parse(state[index].quantity!);
      // remove from provider state
      tempCartList.removeAt(index);
      if (kDebugMode) {
        print("Wishlist Deleted Successfully");
      }
      state = [...state];
    } catch (error) {
      if (kDebugMode) {
        print("Error-log :$error");
      }
    }
  }
}
