import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';

class BaseClient {
  static Future<dynamic> getData({
    required String api,
    dynamic parameter,
    String? apiVersion,
  }) async {
    String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    String url = ConstantStrings.kBaseUrl + apiV + api;
    print('Sending request to: $url');
    if (parameter != null) {
      print("Parameter: $parameter");
    }
    try {
      var response = await Dio().get(
        url,
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
    dynamic body,
    String? apiVersion,
  }) async {
    String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    String url = ConstantStrings.kBaseUrl + apiV + api;
    print('Sending request to: $url');
    log("Post Body: $body");
    try {
      var response = await Dio().post(
        url,
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

  static Future<dynamic> uploadImg({
    required String api,
    required int supplierId,
    required File imgFile,
    String? apiVersion,
  }) async {
    String apiV = apiVersion ?? ConstantStrings.kAPIVersion;
    String url = ConstantStrings.kBaseUrl + apiV + api;
    String fileName = imgFile.path.split('/').last;
    FormData formData = FormData.fromMap(
      {
        "supplierId": supplierId.toString(),
        "Image": await MultipartFile.fromFile(
          imgFile.path,
          filename: fileName,
        ),
      },
    );
    print('Sending request to: $url');
    log("Post Body: $formData");
    try {
      var response = await Dio().post(
        url,
        data: formData,
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
