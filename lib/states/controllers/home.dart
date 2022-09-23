import 'dart:convert';

import 'package:dogventurehq/states/models/web_html.dart';
import 'package:dogventurehq/states/services/home.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool privacyLoading = true.obs;

  WebHtlmModel? policy;

  void getPrivacyPolicy() async {
    privacyLoading(true);
    try {
      var response = await HomeService.getPolicy();
      var list = webHtlmModelFromJson(jsonEncode(response));
      policy = list[0];
    } finally {
      privacyLoading(false);
    }
  }
}
