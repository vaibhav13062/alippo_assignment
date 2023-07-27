import 'package:alippo_assignment/models/product_list.dart';
import 'package:alippo_assignment/network/api_interface.dart';
import 'package:flutter/material.dart';

class GetProductsList extends ChangeNotifier {
  ProductList productList = ProductList();
  bool isLoading = true;
  bool partLoading = false;

  Future<void> fetchInitialData(BuildContext context) async {
    isLoading = true;
    productList = ProductList();
    notifyListeners();
    await ApiInterface()
        .getProductList(
            context: context,
            limit: 10,
            skip: 0,
            onFail: (error) {
              isLoading = true;
              notifyListeners();
            })
        .then((data) {
      productList = ProductList.fromJson(data as Map<String, dynamic>);
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> fetchContinuationData(BuildContext context) async {
    partLoading = true;
    notifyListeners();
    await ApiInterface()
        .getProductList(
            context: context,
            limit: 10,
            skip: productList.products!.length,
            onFail: (error) {
              partLoading = false;
              notifyListeners();
            })
        .then((data) {
      var tempProductList = ProductList.fromJson(data as Map<String, dynamic>);
      productList.products!.addAll(tempProductList.products!);
      productList.limit = tempProductList.limit;
      productList.total = tempProductList.total;
      productList.skip = tempProductList.skip;
      partLoading = false;
      notifyListeners();
    });
  }
}
