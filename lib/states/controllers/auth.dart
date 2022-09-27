import 'dart:io';

import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/supplier.dart';
import 'package:dogventurehq/states/services/auth.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  RxBool isLoggingIn = true.obs;
  RxBool isLoggedIn = false.obs;

  RxBool isUpdating = true.obs;
  RxBool isUpdated = false.obs;

  RxBool dpUploading = false.obs;

  SupplierModel? supplier;

  void login({
    required String email,
    required String password,
  }) async {
    isLoggingIn(true);
    Methods.showLoading();
    try {
      var response = await AuthService.login(
        email: email,
        pass: password,
      );
      supplier = SupplierModel.fromJson(response);
      if (supplier != null) {
        isLoggedIn(true);
        Preference.setLoggedInFlag(true);
        Preference.setUserDetails(supplier!);
      }
    } finally {
      Methods.hideLoading();
      isLoggingIn(false);
    }
  }

  void updateProfile({
    required SupplierModel sModel,
  }) async {
    isUpdating(true);
    Methods.showLoading();
    try {
      var response = await AuthService.updateProfile(
        payload: sModel.toJson(noShopImage: true),
      );
      supplier = SupplierModel.fromJson(response);
      if (supplier != null) {
        isUpdated(true);
        Preference.setUserDetails(supplier!);
      }
    } finally {
      Methods.hideLoading();
      isUpdating(false);
    }
  }

  void updateUserDP({
    required int supplierID,
    required File imageFile,
  }) async {
    dpUploading(true);
    try {
      var response = await AuthService.uploadUserDp(
        supplierId: supplierID,
        file: imageFile,
      );
      supplier = SupplierModel.fromJson(response);
      if (supplier != null) {
        Preference.setUserDetails(supplier!);
      }
    } finally {
      dpUploading(false);
    }
  }
}
