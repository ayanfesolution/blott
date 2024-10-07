import 'package:blott/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static String get baseUrl => 'https://finnhub.io/api/v1/';
}

Future<bool> checkIfIsFirstLaunch() async {
  final prefs = await SharedPreferences.getInstance();

  String? token = prefs.getString(kFirstLaunch);
  if (kDebugMode) {
    print(token);
  }
  if (token == null) {
    return true;
  } else {
    return false;
  }
}
