import 'dart:convert';

import 'package:dogventurehq/states/models/supplier.dart';
import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const userDetails = 'userDetails';
  static const loggedInFlag = 'loginFlag';
  static bool getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  // get
  static SupplierModel getUserDetails() {
    var result = prefs.read(userDetails);
    return SupplierModel.fromJson(json.decode(result));
  }

  // set
  static void setUserDetails(SupplierModel value) {
    print('Storing User Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }

  static void setLoggedInFlag(bool value) {
    prefs.write(loggedInFlag, value);
  }

  static void logOut() {
    prefs.remove(loggedInFlag);
    prefs.remove(userDetails);
  }

  static void clearAll() {
    prefs.erase();
  }
}
