import 'package:blott/utils/constants.dart';
import 'package:blott/utils/injector.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {
  static String get baseUrl => 'https://finnhub.io/api/v1/';
}

Future<bool> checkIfIsFirstLaunch() async {
  String token = await injector.localStorage.returnString(key: kFirstLaunch);
  if (kDebugMode) {
    print(token);
  }
  if (token.isEmpty) {
    return true;
  } else {
    return false;
  }
}
