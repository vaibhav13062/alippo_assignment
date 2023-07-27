import 'dart:io' show File, Platform;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/app_colors.dart';

class MainUtils {
  void preCacheImage(String path, BuildContext context) {
    precacheImage(AssetImage(path), context);
  }

  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.mainColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  String? formatPrice(String? price) => '\$' + price!;

  bool emailValidation(email) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);

    return emailValid;
  }

  // bool validateMobile(String value) {
  //   String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  //   RegExp regExp = new RegExp(patttern);
  //   if (value.length == 0) {
  //     return false;
  //   } else if (!regExp.hasMatch(value)) {
  //     return false;
  //   }
  //   return true;
  // }
  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return '';
  }

  bool passwordValidation(String password) {
    //     r'^
    //   (?=.*[A-Z])       // should contain at least one upper case
    //   (?=.*[a-z])       // should contain at least one lower case
    //   (?=.*?[0-9])      // should contain at least one digit
    //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
    //   .{8,}             // Must be at least 8 characters in length
    // $
    bool passwordValid =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
            .hasMatch(password);
    return passwordValid;
  }

  bool fullNameValidation(String name) {
    //     r'^
    //   (?=.*[A-Z])       // should contain at least one upper case
    //   (?=.*[a-z])       // should contain at least one lower case
    //   (?=.*?[0-9])      // should contain at least one digit
    //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
    //   .{8,}             // Must be at least 8 characters in length
    // $
    bool nameValid = RegExp(r'^[a-zA-Z0-9 ]+$').hasMatch(name);
    return nameValid;
  }

  bool validateMobileBool(String value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  // logOut(context) async {
  //   // showDialog(
  //   //     context: context,
  //   //     builder: (builder) {
  //   //       // return LogoutConfirmPopup(onContinue: () {
  //   //       //   AuthService().signOutGoogle();
  //   //       //   LocalData.saveString(DatabaseKeys().API_TOKEN, '');
  //   //       //   LocalData.saveJson(DatabaseKeys().CUSTOMER_DATA, {});
  //   //       //   navigatorKey.currentState!.pushAndRemoveUntil(
  //   //       //       MaterialPageRoute(builder: (builder) {
  //   //       //     return LoginScreen();
  //   //       //   }), (route) => false).then((value) {
  //   //       //     persistentTabController.jumpToTab(0);
  //   //       //   });
  //   //       // });
  //   //     });
  //
  //   // navigatorKey.currentState!.pushAndRemoveUntil(
  //   //     MaterialPageRoute(builder: (builder) {
  //   //   return LoginScreen();
  //   // }), (route) => false);
  // }

  String getDeviceType() {
    if (Platform.isIOS) {
      return 'IOS';
    } else if (Platform.isAndroid) {
      return 'ANDROID';
    } else {
      return 'web';
    }
  }
}
