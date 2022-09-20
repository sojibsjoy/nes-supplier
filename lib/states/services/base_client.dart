import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';

class BaseClient {
  static Future<dynamic> getData({
    required String api,
    dynamic parameter,
  }) async {
    String url = ConstantStrings.kBaseUrl + ConstantStrings.kAPIVersion + api;
    print('Sending request to: $url');
    try {
      var response = await Dio().get(
        ConstantStrings.kBaseUrl + ConstantStrings.kAPIVersion + api,
        queryParameters: parameter,
      );
      print('GET Method: ${response.statusCode}');
      print(url);
      log("GET Response:  ${response.data}");
      return response.data;
    } catch (e) {
      print("Error: $e");
    }
  }

  static Future<dynamic> postData({
    required String api,
    required dynamic body,
  }) async {
    String url = ConstantStrings.kBaseUrl + ConstantStrings.kAPIVersion + api;
    print('Sending request to: $url');
    log("Post Body: $body");
    try {
      var response = await Dio().post(
        ConstantStrings.kBaseUrl + ConstantStrings.kAPIVersion + api,
        data: body,
      );
      print('POST Method: ${response.statusCode}');
      print(url);
      log("POST Response:  ${response.data}");
      return response.data;
    } catch (e) {
      print("Error: $e");
    }
  }
}
