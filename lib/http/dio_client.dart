import 'dart:convert';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

import '../utils/base_equatable.dart';
import 'httpurls.dart';
import 'logging.dart';



class DioClient {
  static dynamic dioConfig({String? token}) {
      var dynHeader={'contentType': 'application/json'};

    Dio dio = Dio(
      BaseOptions(
          baseUrl: HttpUrl.baseUrl,
          connectTimeout: const Duration(milliseconds: 70000),
          receiveTimeout: const Duration(milliseconds: 70000),
          followRedirects: true,
          headers: dynHeader),
    )..interceptors.add(Logging());
    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    return dio;
  }

  //developer want get from stored while login/register

  static dynamic errorHandling(DioError e) {
    debugPrint('dio exception ${e.message}');

    /// When the server response, but with a incorrect status, such as 404, 503

    if (e.type == DioErrorType.unknown) {
      debugPrint('responseData${DioErrorType.values}');
      return e.response;
    }
    if (e.type == DioErrorType.connectionTimeout) {
      return showToast('Please check your internet connection');
    }
    if (e.type == DioErrorType.receiveTimeout) {
      return showToast('Unable to connect to the server');
    }
    if (e.type == DioErrorType.badResponse) {
      return 'Something went wrong';
    }

    /// When the request is cancelled, dio will throw a error with this type.
    if (e.type == DioErrorType.cancel) {
      return 'Something went wrong';
    }
  }

  static List<dynamic>? listOfMultiPart(List<File>? file) {
    final List<dynamic> multiPartValues = [];
    for (File element in file!) {
      multiPartValues.add(MultipartFile.fromFile(
        element.path,
        filename: element.path.split('/').last,
      ));
    }
    return multiPartValues;
  }
}

//This transformer runs the json decoding in a background thread.
//Thus returing a Future of Map
class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}

Map<String, dynamic> _parseAndDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> _parseJson(String text) {
  return compute(_parseAndDecode, text);
}
