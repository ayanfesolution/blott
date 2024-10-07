import 'dart:io';
import 'package:dio/dio.dart';

class NetworkExceptions {
  static String getDioException(error) {
    if (error is Exception) {
      try {
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              return 'Request cancelled';

            case DioExceptionType.receiveTimeout:
              return 'Request timed out';
            case DioExceptionType.badResponse:
              if (error.response!.data['message'] is List) {
                return error.response!.data['message'][0];
              }
              return error.response!.data['message'];
            case DioExceptionType.sendTimeout:
              return 'Request timed out';
            case DioExceptionType.connectionTimeout:
              return 'Connection timed out!';
            case DioExceptionType.badCertificate:
              return 'Dont have the right authorization';

            case DioExceptionType.connectionError:
              return 'Error in connecting';
            case DioExceptionType.unknown:
              return 'Something went wrong!';
          }
        } else if (error is SocketException) {
          return 'No internet connection!';
        } else {
          return 'Unexpected error occured';
        }
      } on FormatException {
        return 'Bad response format';
      } catch (_) {
        return 'Unexpected error occured';
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return 'Unexpected error occured';
      } else {
        return 'Unexpected error occured';
      }
    }
  }
}