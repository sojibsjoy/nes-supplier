import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Methods {
  static void showSnackbar({
    // required BuildContext context,
    String? title,
    required String msg,
    IconData? icon,
    SnackPosition? position,
  }) {
    Get.snackbar(
      title ?? 'Error',
      msg,
      icon: Icon(
        icon ?? Icons.error,
        color: Colors.red,
      ),
      snackPosition: position ?? SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 20),
      duration: const Duration(seconds: 2),
    );
  }

  static void showLoading() {
    if (!EasyLoading.isShow) {
      EasyLoading.show(status: 'Loading...');
    }
  }

  static void hideLoading() => EasyLoading.dismiss();
}
