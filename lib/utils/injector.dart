import 'package:blott/api/api_client.dart';
import 'package:blott/utils/keyboard_mgt.dart';
import 'package:blott/utils/quick_storage.dart';
import 'package:dio/dio.dart';

class Injector {
  final KeyboardMgt keyboardMgt = KeyboardMgt();
  final QuickStorage localStorage = QuickStorage();
  final ApiClient apiClient = ApiClient(Dio());
}

Injector injector = Injector();


