import 'package:alippo_assignment/models/product_list.dart';
import 'package:flutter/cupertino.dart';

import 'api_base.dart';
import 'package:http/http.dart' as https;

class ApiInterface {
  ApiBase apiBase = ApiBase();

  Map<String, String> mainHeader = {"content-language": "en"};

//----------------------------getProductList----------------------------------------------------------------
  Future<dynamic> getProductList({
    required BuildContext context,
    required int limit,
    required int skip,
    required Function onFail,
  }) {
    return apiBase.get(context, "/products", (p0) {
      onFail();
    }, {
      "limit": limit.toString(),
      "skip": skip.toString(),
    }, mainHeader, true, true);
  }

  //----------------------------getCartList----------------------------------------------------------------
  Future<dynamic> getCartList({
    required BuildContext context,
    required int limit,
    required int skip,
    required Function onFail,
  }) {
    return apiBase.get(context, "/carts", (p0) {
      onFail();
    }, {
      "limit": limit.toString(),
      "skip": skip.toString(),
    }, mainHeader, true, true);
  }

  //----------------------------getProdctList----------------------------------------------------------------
  Future<dynamic> getProductItem({
    required BuildContext context,
    required int productId,
    required Function onFail,
  }) {
    return apiBase.get(context, "/products/" + productId.toString(), (p0) {
      onFail();
    }, {}, mainHeader, true, true);
  }

  //----------------------------getProdctList----------------------------------------------------------------
  Future<dynamic> getCartItem({
    required BuildContext context,
    required int cartId,
    required Function onFail,
  }) {
    return apiBase.get(context, "/carts/" + cartId.toString(), (p0) {
      onFail();
    }, {}, mainHeader, true, true);
  }
}
