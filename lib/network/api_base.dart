import 'dart:convert';
import 'dart:io';

import 'package:alippo_assignment/views/connection_lost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../Utils/main_utils.dart';
import '../main.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as https;

import 'custom_exception.dart';

class ApiBase {
  final String _baseUrlEndpoint = '';
  final String _baseUrl = "dummyjson.com";
  // final String _baseUrl =
  //     "ec2-43-207-4-99.ap-northeast-1.compute.amazonaws.com";
  // final String _baseUrl = "uat.gettho.co.in";

//----------------------------GET-------------------------------------

  Future<dynamic> get(
      BuildContext context,
      String url,
      Function(String) onFail,
      Map<String, String> queryParams,
      Map<String, String> headers,
      bool showError,
      bool showLoading) async {
    // if (showLoading) {
    //   if (!EasyLoading.isShow) {
    //     EasyLoading.show(status: "");
    //   }
    // }

    var responseJson;

    if (kDebugMode) {
      print(
          "URL ==== ${Uri.https(_baseUrl, _baseUrlEndpoint + url, queryParams)}");
    }
    if (kDebugMode) {
      print("HEADERS ==== $headers");
    }
    try {
      final response = await https.get(
          Uri.https(_baseUrl, _baseUrlEndpoint + url, queryParams),
          headers: headers);
      responseJson = _responseReturnFail(response, context, onFail, showError);
    } on SocketException {
      // if (showLoading) {
      //   if (EasyLoading.isShow) {
      //     EasyLoading.dismiss();
      //   }
      // }
      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return ConnectionLost();
      }), (route) => false);

      throw FetchDataException("No Internet");
    }
    // if (showLoading) {
    //   if (EasyLoading.isShow) {
    //     EasyLoading.dismiss();
    //   }
    // }
    return responseJson;

    // return responseJson;
  }

//----------------------------POST-------------------------------------
  Future<dynamic> post(
      BuildContext context,
      String url,
      Function(String) onFail,
      Map<String, String> headers,
      Object body,
      bool showError,
      bool showLoading) async {
    // if (showLoading) {
    //   if (!EasyLoading.isShow) {
    //     EasyLoading.show(status: "");
    //   }
    // }
    var responseJson;
    try {
      final response = await https.post(
          Uri.https(_baseUrl, _baseUrlEndpoint + url),
          headers: headers,
          body: jsonEncode(body));
      if (kDebugMode) {
        print("URL ==== ${Uri.https(_baseUrl, url)}");
      }
      if (kDebugMode) {
        print("BODY ==== $body");
      }
      if (kDebugMode) {
        print("HEADERS ==== $headers");
      }
      if (kDebugMode) {
        print("RESPONSE1 ==== ${response.body}");
      }
      responseJson = _responseReturnFail(response, context, onFail, showError);
    } on SocketException {
      // if (showLoading) {
      //   if (EasyLoading.isShow) {
      //     EasyLoading.dismiss();
      //   }
      // }

      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return ConnectionLost();
      }), (route) => false);

      throw FetchDataException("No Internet");
    }
    // if (showLoading) {
    //   if (EasyLoading.isShow) {
    //     EasyLoading.dismiss();
    //   }
    // }
    return (responseJson);
  }
//----------------------------PUT-------------------------------------
  Future<dynamic> put(
      BuildContext context,
      String url,
      Function(String) onFail,
      Map<String, String> headers,
      Object body,
      bool showError,
      bool showLoading) async {
    // if (showLoading) {
    //   if (!EasyLoading.isShow) {
    //     EasyLoading.show(status: "");
    //   }
    // }
    var responseJson;
    try {
      final response = await https.put(
          Uri.https(_baseUrl, _baseUrlEndpoint + url),
          headers: headers,
          body: body);
      if (kDebugMode) {
        print("URL ==== ${Uri.https(_baseUrl, url)}");
      }
      responseJson = _responseReturnFail(response, context, onFail, showError);
    } on SocketException {
      // if (showLoading) {
      //   if (EasyLoading.isShow) {
      //     EasyLoading.dismiss();
      //   }
      // }

      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return ConnectionLost();
      }), (route) => false);

      throw FetchDataException("No Internet");
    }
    // if (showLoading) {
    //   if (EasyLoading.isShow) {
    //     EasyLoading.dismiss();
    //   }
    // }
    return (responseJson);
  }

  dynamic _responseReturnFail(https.Response response, context,
      Function(String) onFail, bool showErrorPopup) {
    print("Status Code " + response.statusCode.toString());
    // if (EasyLoading.isShow) {
    //   EasyLoading.dismiss();
    // }
    switch (response.statusCode) {
      case 200:
        print(response.body);
        if (kDebugMode) {
          print("RESPONSE ==== ${response.body}");
        }
        var responseJson = json.decode(response.body);

        if (kDebugMode) {
          print("RESPONSE ==== $responseJson");
        }
        return responseJson;
      case 400:

        // MainUtils().showToast(json.decode(response.body));
        // print(response.body);
        var responseJson = json.decode(response.body);
        if (kDebugMode) {
          print("RESPONSE ==== $responseJson");
        }

        // if (EasyLoading.isShow) {
        //   EasyLoading.dismiss();
        // }
        if (showErrorPopup) {
          print("EEEROR");
          if (responseJson.message.isNotEmpty) {
            MainUtils().showToast(responseJson);
          }
        }
        onFail(responseJson.toString());
        throw BadRequestException([responseJson]);
      case 401:
        // MainUtils().showToast('Something went wrong!');
        var responseJson = json.decode(response.body);
        if (kDebugMode) {
          print("RESPONSE ==== $responseJson");
        }

//TODO: ADD NAVIGATION TO LOGIN
        MainUtils().showToast("Session Expired Please Re-Login");
        // AuthenticationService().userLogout(context).then((value) {
        //   if (value == true) {
        //     navigatorKey.currentState!.pushAndRemoveUntil(
        //         MaterialPageRoute(builder: (builder) {
        //           return LoginPhone();
        //         }), (route) => false);
        //   }
        // });

        onFail(responseJson);
        // if (EasyLoading.isShow) {
        //   EasyLoading.dismiss();
        // }

        throw UnauthorisedException([responseJson]);

      // case 403:
      //   throw UnauthorisedException(response.body.toString());
      // case 500:

      default:
        print(response.body);
        // if (EasyLoading.isShow) {
        //   EasyLoading.dismiss();
        // }
        onFail("Something Went Wrong!");
        if (showErrorPopup) {
          MainUtils().showToast("Something Went Wrong!");
        }

        throw FetchDataException("Bad Communication" '${response.statusCode}');
    }
  }
}
