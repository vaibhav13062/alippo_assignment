import 'dart:convert';
import 'package:hive/hive.dart';

class LocalData {
  // static Future init() async {
  //   _sharedPreferences = await SharedPreferences.getInstance();
  // }

  //************************************ COMMON **********************************************

  static bool contains(String key) {
    var box = Hive.box('DefaultDB');
    return box.containsKey(key);
  }

  //************************************ STRING **********************************************

  static Future saveString(String key, String value) async {
    var box = Hive.box('DefaultDB');

    return box.put(key, value);
  }

  static String getString(String key) {
    var box = Hive.box('DefaultDB');
    String value = '';
    if (box.containsKey(key)) {
      value = box.get(key);
    }

    return value;
  }

  //************************************ INT **********************************************

  static Future saveInt(String key, int value) async {
    var box = Hive.box('DefaultDB');
    return box.put(key, value);
  }

  static int getInt(String key) {
    var box = Hive.box('DefaultDB');

    int value = box.get(key);
    return value;
  }
  //************************************ BOOL **********************************************

  static Future saveBool(String key, bool value) async {
    var box = Hive.box('DefaultDB');
    return box.put(key, value);
  }

  static bool getBool(String key) {
    var box = Hive.box('DefaultDB');

    bool value = box.get(key);
    if (value == null) {
      return false;
    } else {
      return value;
    }
  }

  //************************************ DOUBLE **********************************************

  static Future saveDouble(String key, double value) async {
    var box = Hive.box('DefaultDB');
    return box.put(key, value);
  }

  static double getDouble(String key) {
    var box = Hive.box('DefaultDB');
    double value = box.get(key);
    return value;
  }

  //************************************ STRING LIST **********************************************

  static Future saveStringList(String key, List<String> value) async {
    var box = Hive.box('DefaultDB');
    return box.put(key, value);
  }

  static List<String> getStringList(String key) {
    var box = Hive.box('DefaultDB');
    List<String> value = [];
    if (box.get(key) != null) {
      value = box.get(key);
    }
    return value;
  }


  //************************************ Object LIST **********************************************

  static Future saveJsonList(
      String key, List<Map<String, dynamic>> value) async {
    var box = Hive.box('DefaultDB');
    var val = await box.put(key, value);
    return val;
  }

  static Future<List<dynamic>> getJsonList(String key) async {
    var box = Hive.box('DefaultDB');
    List<dynamic> value = await box.get(key) ?? [];
print(value);
    return value;
  }

  //************************************ JSON **********************************************

  static Future saveJson(String key, Map<String, dynamic> value) async {
    var box = Hive.box('DefaultDB');
    JsonEncoder encoder = JsonEncoder.withIndent('  ');
    return box.put(key, encoder.convert(value));
  }

  static Map<String, dynamic> getJson(String key) {
    var box = Hive.box('DefaultDB');
    Map<String, dynamic> value = {};
    if (box.containsKey(key)) {
      value = JsonDecoder().convert(box.get(key));
    }
    return value;
  }
}
