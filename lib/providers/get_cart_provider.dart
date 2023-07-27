import 'package:alippo_assignment/models/cart_list.dart';
import 'package:alippo_assignment/models/product_list.dart';
import 'package:alippo_assignment/network/api_interface.dart';
import 'package:flutter/material.dart';

class GetCartProvider extends ChangeNotifier {
  CartList cartList = CartList();
  bool isLoading = true;
  bool partLoading = false;

  Future<void> fetchInitialData(BuildContext context) async {
    isLoading = true;
    cartList = CartList();
    notifyListeners();
    await ApiInterface()
        .getCartList(
            context: context,
            limit: 10,
            skip: 0,
            onFail: (error) {
              isLoading = true;
              notifyListeners();
            })
        .then((data) {
      cartList = CartList.fromJson(data as Map<String, dynamic>);
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> fetchContinuationData(BuildContext context) async {
    partLoading = true;
    notifyListeners();
    await ApiInterface()
        .getCartList(
            context: context,
            limit: 10,
            skip: cartList.carts!.length,
            onFail: (error) {
              partLoading = false;
              notifyListeners();
            })
        .then((data) {
      var tempProductList = CartList.fromJson(data as Map<String, dynamic>);
      cartList.carts!.addAll(tempProductList.carts!);
      cartList.limit = tempProductList.limit;
      cartList.total = tempProductList.total;
      cartList.skip = tempProductList.skip;
      partLoading = false;
      notifyListeners();
    });
  }
}
